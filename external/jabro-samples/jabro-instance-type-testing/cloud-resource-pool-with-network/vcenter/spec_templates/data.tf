data "vsphere_datacenter" "dc" {
  name = local.vcenter_data.datacenter
}

data "vsphere_compute_cluster" "compute_cluster" {
  name          = local.vcenter_data.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_distributed_virtual_switch" "dvs" {
  name          = local.vcenter_data.dvs
  datacenter_id = data.vsphere_datacenter.dc.id
}