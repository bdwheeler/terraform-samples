variable "subnet_cidr" {
  type = string
  description = "CIDR for the the VPC"
}

resource "aws_subnet" "main" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnet_cidr
  tags = {
    Name = "${var.vpc_name}-subnet"
  }
}
