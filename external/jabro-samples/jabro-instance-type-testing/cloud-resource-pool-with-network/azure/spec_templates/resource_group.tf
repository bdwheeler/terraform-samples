variable "resource_group_name" {
    type = string
    description = "Name for the resource group"
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = local.user_inputs.location
}