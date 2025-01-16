output "resource_group_id" {
  value = azurerm_resource_group.network.id
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "aks_subnet_id" {
  value = azurerm_subnet.aks.id
}

output "virtual_node_subnet_id" {
  value = azurerm_subnet.virtual_node.id
}
