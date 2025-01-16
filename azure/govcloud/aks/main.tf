resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = data.terraform_remote_state.iam.outputs.resource_group_location
  resource_group_name = data.terraform_remote_state.iam.outputs.resource_group_name
  dns_prefix          = var.dns_prefix
  default_node_pool {
    name       = "default"
    node_count = var.default_node_pool_size
    vm_size    = var.vm_size
    vnet_subnet_id = data.terraform_remote_state.network.outputs.aks_subnet_id
  }
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "karpenter" {
  count                = length(var.karpenter_node_sizes)
  name                 = "karpenter-${count.index}"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size              = var.karpenter_node_sizes[count.index]
  enable_auto_scaling  = true
  min_count            = var.karpenter_node_pool_min
  max_count            = var.karpenter_node_pool_max
  node_labels          = {
    "karpenter.sh/capacity-type" = "on-demand"
    "karpenter.sh/instance-type" = var.karpenter_node_sizes[count.index]
  }
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}

output "argocd_url" {
  description = "ArgoCD URL for GitOps management"
  value       = "http://${azurerm_kubernetes_cluster.aks.fqdn}/argocd"
}