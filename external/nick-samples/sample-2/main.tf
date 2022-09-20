provider "aws" {
  version = "~> 2.0"
  region = var.aws_region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "~> v2.0"

  name = var.vpc_name
  azs = var.aws_azs
  cidr = var.vpc_cidr
  enable_nat_gateway = true
  public_subnets = var.vpc_public_subnets
  database_subnets = var.vpc_database_subnets
}

resource "aws_key_pair" "auth" {
  public_key = file(var.pubkey_path)
}

data "aws_route53_zone" "this" {
  name = var.route53_domain_name
}

module "db" {
  source = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"
  identifier = "morpheus-db"

  allocated_storage = "5"
  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"
  backup_retention_period = 0
  engine = "mysql"
  engine_version = "5.7.30"
  major_engine_version = "5.7"
  family = "mysql5.7"
  parameter_group_name = ""
  instance_class = "db.t2.small"
  name = var.db_name
  username = var.db_username
  password = var.db_password
  port = "3306"
  subnet_ids = module.vpc.database_subnets
  vpc_security_group_ids = [module.morpheus_db_sg.this_security_group_id]

  parameters = [
    {
      name = "character_set_client"
      value = "utf8"
    },
    {
      name = "character_set_server"
      value = "utf8"
    }
  ]
}

module "aws_es" {
  source = "git::https://github.com/lgallard/terraform-aws-elasticsearch.git"

  domain_name = var.es_domain_name
  elasticsearch_version = "7.7"
  cluster_config = {
    dedicated_master_enabled = "false"
    instance_count           = "3"
    instance_type            = "t2.medium.elasticsearch"
    zone_awareness_enabled   = "true"
    availability_zone_count  = "3"
  }
  ebs_options = {
    ebs_enabled = "true"
    volume_size = "10"
  }
  encrypt_at_rest = {
    enabled = "false"
    kms_key_id = ""
  }
  log_publishing_options = {
    enabled = "false"
  }
  node_to_node_encryption_enabled = "false"
  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }
  access_policies = data.aws_iam_policy_document.es_ip_access_policy.json
}

### Doesn't work yet
### https://github.com/hashicorp/terraform-provider-aws/issues/16030
# resource "aws_mq_broker" "rmq_broker" {
#   broker_name = var.rmq_broker_name
#   engine_type = "RabbitMQ"
#   engine_version = "3.8.6"
#   host_instance_type = "mq.t3.micro"
#   security_groups = [module.morpheus_rabbit_access_sg.this_security_group_id]
#   user {
#     username = "rmquser"
#     password = "rmqpass123456"
#   }
# }

resource "tls_private_key" "ansible-key" {
  algorithm = "RSA"
  rsa_bits = "2048"
}

module "ansible_controller" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"
  name = "ansible_controller"
  ami = var.ansible_amis[var.aws_region]
  instance_type = "t3.small"
  subnet_id = module.vpc.public_subnets[0]
  key_name = aws_key_pair.auth.id
  vpc_security_group_ids = [
    module.morpheus_ui_ssh_sg.this_security_group_id]
  instance_count = 1
  user_data = <<EOF
#!/bin/bash

# UPDATE OS
# yum upgrade -y
yum update -y
yum install -y git
amazon-linux-extras install ansible2 python3.8 -y

# SET ANSIBLE ENV VARIABLES
export ANSIBLE_DISPLAY_ARGS_TO_STDOUT=True

echo "${tls_private_key.ansible-key.private_key_pem}" >> /root/.ssh/id_rsa
chmod 0600 /root/.ssh/id_rsa

ansible -m lineinfile -a "path=/etc/ansible/ansible.cfg regexp='key_checking' line='host_key_checking = False'" localhost

cd /root

### RABBITMQ CONFIGURATION
# Replaces with terraform provider
#wget https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/v3.8.9/bin/rabbitmqadmin
#rmqadmin='python3.8 rabbitmqadmin -H ${var.rmq_broker_endpoint_temp} -P 443 -s -u ${var.rmq_user} -p ${var.rmq_password}'
#$rmqadmin declare policy name='ha-all' pattern='.*' definition='{"ha-mode": "all", "ha-sync-mode": "automatic"}' priority=1
#$rmqadmin declare policy name='morpheusAgentActions' pattern='morpheusAgentActions.*' apply-to='queues' definition='{"expires": 1800000, "ha-mode": "all"}' priority=2
#$rmqadmin declare policy name='statCommands' pattern='statCommands.*' apply-to='queues' definition='{"expires": 1800000, "ha-mode": "all"}' priority=2
#$rmqadmin declare policy name='monitorJobs' pattern='monitorJobs.*' apply-to='queues' definition='{"expires": 1800000, "ha-mode": "all"}' priority=2

### ANSIBLE
git clone https://github.com/tryfan/ansible-morpheus-hadeploy
cd ansible-morpheus-hadeploy
git checkout aws
ansible-galaxy install -r roles/requirements.yml --roles-path=roles/

# Create Ansible inventory
echo "[morpheus]" > inventory
%{ for ui_ipaddress in module.morpheus_ui_nodes.private_ip ~}
echo ${ui_ipaddress} ansible_user=centos >> inventory
%{ endfor ~}

echo "---" > vars.yml
echo "morpheus_appliance_url: 'https://${var.morpheus_fqdn}'" >> vars.yml
echo "morpheus_package_centos: '${var.morpheus_package}'" >> vars.yml 
echo "morpheus_mysql_external: true" >> vars.yml
echo "morpheus_db_host: '${module.db.this_db_instance_address}'" >> vars.yml
echo "morpheus_db: ${var.db_name}" >> vars.yml
echo "morpheus_db_user: ${var.db_username}" >> vars.yml
echo "morpheus_db_pass: ${var.db_password}" >> vars.yml
echo "morpheus_db_port: ${var.db_port}" >> vars.yml

echo "morpheus_elastic_external: true" >> vars.yml
echo "morpheus_elastic_cluster_name: ${var.es_domain_name}" >> vars.yml 
echo "morpheus_elastic_hosts:" >> vars.yml
echo "- host: '${module.aws_es.endpoint}'" >> vars.yml
echo "  port: 443" >> vars.yml
echo "morpheus_elastic_tls: true" >> vars.yml

echo "morpheus_rabbitmq_external: true" >> vars.yml
echo "morpheus_rabbitmq_vhost: '/'" >> vars.yml
echo "morpheus_rabbitmq_user: ${var.rmq_user}" >> vars.yml
echo "morpheus_rabbitmq_password: ${var.rmq_password}" >> vars.yml
echo "morpheus_rabbitmq_lb: ${var.rmq_broker_endpoint_temp}" >> vars.yml
echo "morpheus_rabbitmq_port: ${var.rmq_port}" >> vars.yml
echo "morpheus_rabbitmq_use_tls: true" >> vars.yml
# echo "" >> vars.yml

ansible-playbook -i inventory -e @vars.yml morpheus.yml
EOF
}

resource "aws_efs_file_system" "ui_shared_storage" {
  creation_token = "ui-shared"
}

resource "aws_efs_mount_target" "ui_shared_mount_target" {
  count = var.vpc_public_subnet_count
  file_system_id = aws_efs_file_system.ui_shared_storage.id
  subnet_id      = module.vpc.public_subnets[count.index]
  security_groups = [module.morpheus_nfs_sg.this_security_group_id]
}

module "morpheus_ui_nodes" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"
  ami = var.aws_amis[var.aws_region]
  instance_type = "t2.xlarge"
  name = "morph_ui"
  key_name = aws_key_pair.auth.id
  instance_count = var.ui_node_count
  subnet_id = module.vpc.public_subnets[0]
  user_data = <<EOF
#!/bin/bash
systemctl disable --now iptables
echo "${tls_private_key.ansible-key.public_key_openssh}" >> /home/centos/.ssh/authorized_keys

mkdir -p /var/opt/morpheus/morpheus-ui

%{ for target in aws_efs_mount_target.ui_shared_mount_target ~}
echo "${target.ip_address}:/ /var/opt/morpheus/morpheus-ui        nfs   defaults        0 0" | cat >> /etc/fstab
%{ endfor ~}

mount -a
EOF
  vpc_security_group_ids = [
    module.morpheus_ui_https_sg.this_security_group_id,
    module.morpheus_ui_ssh_sg.this_security_group_id
  ]
  root_block_device = [
    {
    volume_size = 20
    }
  ]
  tags = {
    ui_node = "true"
  }
  iam_instance_profile = aws_iam_instance_profile.ui_node_instance_profile.name
}

module "morpheus_ui_alb" {
  source = "terraform-aws-modules/alb/aws"
  version = "~> 5.0"

  name = "morpheus-ui-alb"
  vpc_id = module.vpc.vpc_id
  subnets = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  security_groups = [module.morpheus_ui_https_sg.this_security_group_id]
  target_groups = [{
    name_prefix = "pre-"
    backend_protocol = "HTTPS"
    backend_port = 443
    target_type = "instance"
    stickiness  = {
      type = "lb_cookie"
    }
    health_check = {
      enabled = true
      interval = 10
      path = "/ping"
      matcher = 200
      protocol = "HTTPS"
      healthy_threshold = 3
      unhealthy_threshold = 3
      timeout = 6
    }
    tags = {
      InstanceTargetGroupTag = "morpheusui"
    }
  }]
  https_listeners = [{
    port = 443
    protocol = "HTTPS"
    certificate_arn = var.ssl_certificate_arn
    target_group_index = 0
  }]
}

resource "aws_lb_target_group_attachment" "morpheusui" {
  count = var.ui_node_count
  target_group_arn = module.morpheus_ui_alb.target_group_arns[0]
  target_id = module.morpheus_ui_nodes.id[count.index]
}

resource "aws_route53_record" "point_cname" {
  name = var.morpheus_fqdn
  type = "CNAME"
  zone_id = data.aws_route53_zone.this.id
  records = [module.morpheus_ui_alb.this_lb_dns_name]
  ttl = 300
}
