variable "ui_node_count" {
  default = 3
}
variable "es_domain_name" {
  default = "morpheus-es"
}
variable "route53_domain_name" {}

# variable "user_data" {
#   default = <<EOF
# #!/bin/bash
# systemctl disable --now iptables
# EOF
# }

variable "ssh_allowed_ips" {}
variable "pubkey_path" {}

variable "aws_region" {
  default = "us-east-1"
}

variable "aws_azs" {
  default = ["us-east-1d", "us-east-1e"]
}

variable "aws_amis" {
  default = {
    ca-central-1 = "ami-0252eebc56636a56b"
    us-east-1 = "ami-06cf02a98a61f9f5e"
    us-west-1 = "ami-02676464a065c9c05"
    us-west-2 = "ami-0a248ce88bcc7bd23"
  }
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "vpc_public_subnets" {
  default = ["10.0.10.0/24", "10.0.20.0/24"]
}
variable "vpc_public_subnet_count" {
  default = 2
}
variable "vpc_database_subnets" {
  default = ["10.0.30.0/24", "10.0.31.0/24"]
}
variable "vpc_name" {
  default = "morpheus_test_vpc"
}

variable "ansible_amis" {
  default = {
    us-east-1 = "ami-0947d2ba12ee1ff75"
  }
}

variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "db_port" {
  default = "3306"
}

variable "rmq_broker_name" {
  default = "NOTUSEDYET"
}
variable "rmq_broker_endpoint_temp" {}
variable "rmq_user" {}
variable "rmq_password" {}

variable "morpheus_fqdn" {}

variable "morpheus_package" {
  default = "https://downloads.morpheusdata.com/files/morpheus-appliance-4.2.4-1.el7.x86_64.rpm"
}

variable "ssl_certificate_arn" {}