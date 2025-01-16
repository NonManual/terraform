output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "argocd_url" {
  description = "ArgoCD URL for GitOps management"
  value       = "http://${azurerm_kubernetes_cluster.aks.fqdn}/argocd"
}
