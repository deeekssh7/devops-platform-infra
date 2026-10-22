# ------------------------------------------------------------------------------
# Install Secrets Store CSI Driver
# The postman who delivers secrets to pods
# ------------------------------------------------------------------------------
resource "helm_release" "secrets_store_csi_driver" {
  name       = "csi-secrets-store"
  repository = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
  chart      = "./secrets-store-csi-driver-provider-aws-3.1.4.tgz"
  namespace  = "kube-system"

  set = [
    {
      name  = "syncSecret.enabled"
      value = "true"
    },
    {
      name  = "tokenRequests[0].audience"
      value = "pods.eks.amazonaws.com"
    }
  ]

  wait            = true
  timeout         = 600
  cleanup_on_fail = true

  depends_on = [
    aws_eks_addon.pod_identity
  ]
}

# ------------------------------------------------------------------------------
# Install AWS Secrets Provider
# The GPS that tells postman where AWS Secrets Manager is
# ------------------------------------------------------------------------------
resource "helm_release" "aws_secrets_provider" {
  name       = "secrets-provider-aws"
  chart      = "./secrets-store-csi-driver-provider-aws-3.1.4.tgz"
  namespace  = "kube-system"

  set = [
    {
      name  = "secrets-store-csi-driver.install"
      value = "false"
    }
  ]

  wait            = true
  timeout         = 600
  cleanup_on_fail = true

  depends_on = [
    aws_eks_addon.pod_identity,
    helm_release.secrets_store_csi_driver
  ]
}