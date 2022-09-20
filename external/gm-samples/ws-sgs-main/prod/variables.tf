variable "region" {
    type = string
    default = "us-gov-west-1"
}

variable "access_key" {
    type = string
}

variable "secret_key" {
    type = string
}

variable "workspaces_cidr"{
    default = "10.57.0.0/20"
}

