
output "vm-id" {
  description = "The new vm id in vcenter"
  value = vsphere_virtual_machine.vm.id
}
