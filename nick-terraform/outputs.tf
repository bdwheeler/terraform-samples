output "ansible_public_ip" {
  value = module.ansible_controller.public_ip
}

output "morphui_public_ips" {
  value = module.morpheus_ui_nodes.public_ip
}

output "morphui_private_ips" {
  value = module.morpheus_ui_nodes.private_ip
}
