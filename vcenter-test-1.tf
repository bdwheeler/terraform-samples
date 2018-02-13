provider "vsphere" {
  user           = "${var.cloudUsername}"
  password       = "${var.cloudPassword}"
  vsphere_server = "${var.cloudUrl}"
  version = "~> 1.3"
  # if you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "${var.datacenterName}"
}

data "vsphere_datastore" "datastore" {
  name          = "labs-qnap-240"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "labs-den-prod-cluster/Resources"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_template" "template" {
  name          = Morpheus Ubuntu 16.04.3 v1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  name             = "terraform-test"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  num_cpus = 2
  memory   = 1024
  guest_id = "other3xLinux64Guest"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    name = "disk0"
    thin_provisioned = true
    size  = 20
  }

  clone {
    template_uuid = "${data.vsphere_template.template.id}"
  }

}