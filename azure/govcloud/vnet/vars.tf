# Resource Group
variable "resource_group_name" {
  default = "example-resource-group"
}

# Virtual Network
variable "vnet_name" {
  default = "example-vnet"
}

variable "vnet_address_space" {
  default = ["10.0.0.0/16"]
}

# Subnet
variable "subnet_name" {
  default = "default"
}

variable "subnet_address_prefix" {
  default = "10.10.0.0/26" # Matches the subnet mask 255.255.255.192
}

