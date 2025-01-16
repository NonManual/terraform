resource "helm_release" "argocd" {
  name       = "argocd"
  chart      = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  namespace  = "argocd"
}

resource "kubernetes_namespace" "observability" {
  metadata {
    name = "observability"
  }
}

resource "helm_release" "loki" {
  name       = "loki"
  chart      = "loki"
  repository = var.helm_repo
  namespace  = kubernetes_namespace.observability.metadata[0].name
}

resource "helm_release" "grafana" {
  name       = "grafana"
  chart      = "grafana"
  repository = var.helm_repo
  namespace  = kubernetes_namespace.observability.metadata[0].name
}

resource "helm_release" "tempo" {
  name       = "tempo"
  chart      = "tempo"
  repository = var.helm_repo
  namespace  = kubernetes_namespace.observability.metadata[0].name
}

resource "helm_release" "mimir" {
  name       = "mimir"
  chart      = "mimir"
  repository = var.helm_repo
  namespace  = kubernetes_namespace.observability.metadata[0].name
}
