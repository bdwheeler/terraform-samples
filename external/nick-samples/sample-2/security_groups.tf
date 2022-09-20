module "morpheus_ui_https_sg" {
  name = "morpheus_ui_443_sg"
  source  = "terraform-aws-modules/security-group/aws//modules/https-443"
  version = "~> 3.0"
  vpc_id = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "morpheus_ui_ssh_sg" {
  name = "morpheus_ui_22_sg"
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 3.0"
  vpc_id = module.vpc.vpc_id
  ingress_cidr_blocks = var.ssh_allowed_ips
}

module "morpheus_es_cluster_sg" {
  name = "morpheus_es_cluster_sg"
  source  = "terraform-aws-modules/security-group/aws//modules/elasticsearch"
  version = "~> 3.0"
  vpc_id = module.vpc.vpc_id
  ingress_cidr_blocks = module.vpc.public_subnets_cidr_blocks
}

module "morpheus_es_access_sg" {
  name = "morpheus_es_access_sg"
  source  = "terraform-aws-modules/security-group/aws//modules/elasticsearch"
  version = "~> 3.0"
  vpc_id = module.vpc.vpc_id
  ingress_cidr_blocks = module.vpc.public_subnets_cidr_blocks
}

module "morpheus_rabbit_cluster_sg" {
  name = "morpheus_rabbit_cluster_sg"
  source  = "terraform-aws-modules/security-group/aws//modules/rabbitmq"
  version = "~> 3.0"
  vpc_id = module.vpc.vpc_id
  ingress_cidr_blocks = module.vpc.public_subnets_cidr_blocks
}

module "morpheus_rabbit_access_sg" {
  name = "morpheus_rabbit_access_sg"
  source  = "terraform-aws-modules/security-group/aws//modules/rabbitmq"
  version = "~> 3.0"
  vpc_id = module.vpc.vpc_id
  ingress_cidr_blocks = module.vpc.public_subnets_cidr_blocks
}

module "morpheus_db_sg" {
  name = "morpheus_db_sg"
  source  = "terraform-aws-modules/security-group/aws//modules/mysql"
  version = "~> 3.0"
  vpc_id = module.vpc.vpc_id
  ingress_cidr_blocks = module.vpc.public_subnets_cidr_blocks
}

module "morpheus_nfs_sg" {
  name = "morpheus_nfs_sg"
  source  = "terraform-aws-modules/security-group/aws//modules/nfs"
  version = "~> 3.0"
  vpc_id = module.vpc.vpc_id
  ingress_cidr_blocks = module.vpc.public_subnets_cidr_blocks
}