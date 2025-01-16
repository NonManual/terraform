# Existing variables
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "aks_subnet_name" {
  description = "Name of the AKS subnet"
  type        = string
}

variable "aks_subnet_address_space" {
  description = "Address space for the AKS subnet"
  type        = list(string)
}

variable "virtual_node_subnet_name" {
  description = "Name of the virtual node subnet"
  type        = string
}

variable "virtual_node_subnet_address_space" {
  description = "Address space for the virtual node subnet"
  type        = list(string)
}

# New variables for missing resources
variable "lb_name" {
  description = "Name of the Load Balancer"
  type        = string
}


variable "probe_http_port" {
  description = "The port you are probing with LB probe"
  type        = number
  default     = 80
}

variable "probe_http_protocol" {
  description = "The protocol you are probing"
  type        = string
  default =   "Http"
}

variable "probe_request_path" {
  description = "the request path of the lb probe"
  type        =  string
  default     =  "/health"
}

variable "sp_name" {
  description = "Name of the Service Principal"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the Public IP for Load Balancer"
  type        = string
}

variable "nat_gateway_name" {
  description = "Name of the NAT Gateway"
  type        = string
}

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}

variable "route_table_name" {
  description = "Name of the Route Table"
  type        = string
}

variable "remote_state_resource_group_name" {
  description = "The resource group the remote state is stored in"
  type        = string
}

variable "remote_state_storage_account_name" {
  description = "The storage account the remote state is in"
  type        = string
}

variable "remote_state_container_name" {
  description = "The container the remote state is stored in "
  type        = string
}