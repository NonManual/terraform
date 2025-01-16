output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_kubeconfig" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}

output "argocd_url" {
  description = "ArgoCD URL for GitOps management"
  value       = "http://${azurerm_kubernetes_cluster.aks.fqdn}/argocd"
}