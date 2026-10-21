resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "7.3.11"

  values = [
    <<-EOT
    server:
      service:
        type: LoadBalancer
    EOT
  ]
}

resource "kubernetes_namespace" "retail_store" {
  metadata {
    name = "retail-store"
  }
}