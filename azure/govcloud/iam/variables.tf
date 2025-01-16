# Existing variables
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "sp_name" {
  description = "Name of the service principal"
  type        = string
}

variable "location" {
  description = "Location of the resource group"
  type        = string
  default = "usgovvirginia"
}

variable "tags" {
  description = "Tags for the resource group"
  type        = map(string)
  default     = {}
}

variable "subscription_id" {
  description = "Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Subscription ID"
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