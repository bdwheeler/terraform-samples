
variable "cloudUrl" {}

variable "cloudUsername" {
  sensitive = true
}

variable "cloudPassword" {
  sensitive = true
}

variable "cloudDatacenter" {}

variable "vmDatastore" {}

variable "vmResourcePool" {}

variable "vmNetwork" {}

variable "vmUsername" {
  sensitive = true
}

variable "vmPassword" {
  sensitive = true
}
