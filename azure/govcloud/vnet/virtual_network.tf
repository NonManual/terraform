resource "azurerm_virtual_network" "gov_east" {
  name                = var.vnet_name
  location            = azurerm_resource_group.vnet_resource_group.location
  resource_group_name = azurerm_resource_group.vnet_resource_group.name
  address_space       = var.vnet_address_space

  subnet {
    name           = var.subnet_name
    address_prefix = var.subnet_address_prefix
  }
}
