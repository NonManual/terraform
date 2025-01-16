variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "aks_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
}

variable "vm_size" {
  description = "VM size for the AKS nodes"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet for the AKS cluster"
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

variable "default_node_pool_size" {
  description = "The  number of nodes in the default node pool"
  type = number
  default = 2
}

variable "karpenter_node_sizes" {
  description = "List of VM sizes for the Karpenter node pool"
  type        = list(string)
  default     = ["Standard_B2s", "Standard_D2s_v3", "Standard_D4_v3"]
}

variable "karpenter_node_pool_min" {
  description = "Minimum node pool size for the Karpenter node pool"
  type        = number
  default     = 1
}
variable "karpenter_node_pool_max" {
  description = "Maximum node pool size for the Karpenter node pool"
  type        = number
  default     = 10
}