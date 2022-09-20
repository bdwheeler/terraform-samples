
provider "vsphere" {
  user           = var.cloudUsername
  password       = var.cloudPassword
  vsphere_server = var.cloudUrl
  allow_unverified_ssl = true
}
