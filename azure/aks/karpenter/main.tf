resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = var.node_vm_size
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
  min_count            = 1
  max_count            = 10
  node_labels          = {
    "karpenter.sh/capacity-type" = "on-demand"
    "karpenter.sh/instance-type" = var.karpenter_node_sizes[count.index]
  }
}
