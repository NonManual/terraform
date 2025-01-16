variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default = "aks-observability-rg"
}

variable "location" {
  description = "Azure location for resources"
  type        = string
  default = "East US"
}

variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
  default = "aks-karpenter-cluster"

}

variable "karpenter_node_sizes" {
  description = "List of VM sizes for the Karpenter node pool"
  type        = list(string)
  default     = ["Standard_B2s", "Standard_D2s_v3", "Standard_D4_v3"]
}


variable "node_vm_size" {
  description = "The VM size for AKS nodes"
  type        = string
  default = "Standard_D2_v3"

}

variable "helm_repo" {
  description = "Helm chart repository for observability stack"
  type        = string
  default = "https://grafana.github.io/helm-charts"
}
