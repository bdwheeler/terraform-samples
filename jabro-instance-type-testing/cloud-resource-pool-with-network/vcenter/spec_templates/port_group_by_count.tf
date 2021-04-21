resource "vsphere_distributed_port_group" "pg" {
  count = var.port_group_count
  name                            = "${local.user_inputs.resource_pool_name}-pg-0${count.index}"
  distributed_virtual_switch_uuid = data.vsphere_distributed_virtual_switch.dvs.id

  vlan_id = "${local.user_inputs.vlan_prefix}${count.index}"
}