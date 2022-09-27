variable "cloudUrl" {
  default = "vcenter.wheeler.house"
}
variable "vcenterUsername" {
  default = "administrator@wheeler.house"
}
variable "vcenterPassword" {
}
variable "datacenterName" {
  default = "wheeler"
}

terraform {
  required_version = ">= 1.0"
}

provider "vsphere" {
  user           = var.vcenterUsername
  password       = var.vcenterPassword
  vsphere_server = var.cloudUrl
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.datacenterName
}

data "vsphere_datastore" "datastore" {
  name          = "wheeler-vsan"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "terraform"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "vms"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "Morpheus Ubuntu 20.04.4 v2"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "tf-test-vm-1"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 1
  memory   = 1024
  guest_id = "ubuntu64Guest"

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label            = "disk0"
    thin_provisioned = true
    size             = 15
  }

  disk {
    label       = "disk1"
    size        = 5
    unit_number = 1
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  connection {
    type     = "ssh"
    user     = "bwheeler"
    password = "F0rsberg"
  }
  
}
