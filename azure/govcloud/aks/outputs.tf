output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_kubeconfig" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}
