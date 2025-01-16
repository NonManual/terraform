resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = data.terraform_remote_state.iam.outputs.resource_group_location
  resource_group_name = data.terraform_remote_state.iam.outputs.resource_group_name
}

resource "azurerm_subnet" "aks" {
  name                 = var.aks_subnet_name
  resource_group_name  = data.terraform_remote_state.iam.outputs.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.aks_subnet_address_space
}

resource "azurerm_subnet" "virtual_node" {
  name                 = var.virtual_node_subnet_name
  resource_group_name  = data.terraform_remote_state.iam.outputs.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.virtual_node_subnet_address_space
}

resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = data.terraform_remote_state.iam.outputs.resource_group_location
  resource_group_name = data.terraform_remote_state.iam.outputs.resource_group_name
  sku                 = "Standard"
}

resource "azurerm_public_ip" "lb_ip" {
  name                = var.public_ip_name
  location            = data.terraform_remote_state.iam.outputs.resource_group_location
  resource_group_name = data.terraform_remote_state.iam.outputs.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name                = "backend_pool"
  loadbalancer_id     = azurerm_lb.lb.id
}

resource "azurerm_lb_probe" "http_probe" {
  name                = "http_probe"
  loadbalancer_id     = azurerm_lb.lb.id
  port                = var.probe_http_port
  protocol            = var.probe_http_protocol
  request_path        = var.probe_request_path
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
