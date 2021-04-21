locals {
  bitCount = sum([tonumber(local.subnet_options.cidrMask),-tonumber(split("/",var.address_space)[1])])
}

resource "azurerm_subnet" "main" {
    count               = tonumber(local.subnet_options.subnetCount)
    name                 = "${azurerm_resource_group.main.name}-vnet-0${count.index}"
    resource_group_name  = azurerm_resource_group.main.name
    virtual_network_name = azurerm_virtual_network.main.name
    address_prefixes     = [cidrsubnet(var.address_space, local.bitCount, count.index)]
}