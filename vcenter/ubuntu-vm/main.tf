terraform {
  required_version = ">= 1.0"
}

data "vsphere_datacenter" "dc" {
  name = var.cloudDatacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vmDatastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.vmResourcePool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vmNetwork
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "Morpheus Ubuntu 20.04.4 v2"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "<%=app.name%>"
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

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  connection {
    type     = "ssh"
    user     = var.vmUsername
    password = var.vmPassword
  }

}
