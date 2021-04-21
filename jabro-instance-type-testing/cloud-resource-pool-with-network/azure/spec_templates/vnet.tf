variable "address_space" {
    type = string
    description = "Address space for the vnet"
}

resource "azurerm_virtual_network" "main" {
  name                = "${azurerm_resource_group.main.name}-vnet"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = [var.address_space]
}