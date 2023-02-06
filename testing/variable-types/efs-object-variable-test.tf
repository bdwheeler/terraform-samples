#variables
variable "access_key" {
  sensitive = true
}

variable "secret_key" {
  sensitive = true
}

variable "aws_region" {
	default = "us-west-1"
}

variable "efsName" {
  type = string
  default = "<%=input.name%>"
}

variable "efsTags" {
	type = object({
		Name = string
		Value = string
	})
}

### Initialize Providers
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.aws_region
}

### resource
resource "aws_efs_file_system" "efs" {
  performance_mode = "generalPurpose"
  throughput_mode = "bursting"
  tags = {
    Name = var.efsName
    ObjectName = var.efsTags.Name
  }
}
