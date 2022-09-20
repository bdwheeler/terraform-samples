variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "region" {
  type = string
  default = "us-west-2"
}

variable "category_types" {
  type = list(string)
  default = ["VirtualMachine"]
}

locals {
  time = tostring(formatdate("MM-DD-YYYY", timestamp()))
}
