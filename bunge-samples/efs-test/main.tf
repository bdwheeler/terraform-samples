#variables
variable "access_key" {
  sensitive = true
}

variable "secret_key" {
  sensitive = true
}

variable "efsName" {
  type = string
  default = "<%=customOptions.shareName%>"
}

variable "environment" {
  type = string
  default = "<%=input.instanceContext%>"
}

variable "externalVar" {
  type = string
}

### Initialize Providers
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = "us-east-1"
}

### resource
resource "aws_efs_file_system" "efs" {
  performance_mode = "generalPurpose"
  throughput_mode = "bursting"
  tags = {
    Name = var.efsName
    Environment = var.environment
  }
}
