terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 3.35.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key

}

variable "region" {
    type = string
    default = "us-east-1"
}

locals {
  #  Common tags to be assigned to all resources
#   default_tags = {
#     Owner    = "<%=username%>"
#     Group = "<%=groupName%>"
#     Management_Tool = "Terraform"
#     Management_Platform = "Morpheus"
#   }
  
#   subnet_options = {
#     cidrMask = "<%=customOptions.cidrMask%>"
#     subnetCount = "<%=customOptions.subnetCount%>"
#   }
#   vpc_options = {
#     region = "<%=customOptions.awsRegion%>"
#     aws_account = "<%=customOptions.awsAccount%>"
#   }

  morph_vars = {
    morph_url = "<%=morpheus.applianceUrl%>"
    api_key = "<%=server.apiKey%>"
    agent_install_endpoint = "api/server-script/agentInstall?apiKey="
  }
  commands = {
    agent_install_command = "curl -k -s ${local.morph_vars.morph_url}${local.morph_vars.agent_install_endpoint}${local.morph_vars.api_key} | bash"
  }
}

resource "aws_vpc" "morph_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "ec2-testing"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.morph_vpc.id
}

resource "aws_subnet" "morph_subnet" {
  vpc_id            = aws_vpc.morph_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  depends_on = [aws_internet_gateway.igw]
  
  tags = {
    Name = "ec2-testing"
  }
}

resource "aws_network_interface" "morph_if" {
  subnet_id   = aws_subnet.morph_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "instance" {
  ami           = "ami-09e67e426f25ce0d7" # us-east-1
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.morph_if.id
    device_index         = 0
  }

  tags = {
      Name = "ec2-testing"
      Command = local.commands.agent_install_command
  }
}

resource "aws_eip" "main" {
    vpc = true
    network_interface = aws_network_interface.morph_if.id
    associate_with_private_ip = "172.16.10.100"

    depends_on = [aws_internet_gateway.igw]
}