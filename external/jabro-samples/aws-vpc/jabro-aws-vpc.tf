variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
} 
variable "vpc_cidr" {
  type = string
  description = "CIDR for the the VPC"
}
variable "vpc_name" {
  type = string
  description = "Name for the VPC"
  default = "<%=customOptions.house%>"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.35.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr 
  tags = {
    "Name" = var.vpc_name
  }
}

output "aws_vpc" {
  value = aws_vpc.main
}
