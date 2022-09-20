variable "subnet_cidr" {
  type = string
  default = "172.16.0.0/24"
}

variable "subnet_az" {
  type = string
  default = "us-west-2a"
}

variable "vpc_id" {
  type = string
}

resource "aws_subnet" "subnet" {
  vpc_id            = var.vpc_id //aws_vpc.vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.subnet_az

  tags = {
    Name = var.efsName
    Time = tostring(formatdate("MM-DD-YYYY", timestamp()))
  }
  
}

output "aws_subnet" {
  value = aws_subnet.subnet
}
