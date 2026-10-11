# ------------------------------------------------------------------------------
# Install Secrets Store CSI Driver
# The postman who delivers secrets to pods
# ------------------------------------------------------------------------------
resource "helm_release" "secrets_store_csi_driver" {
  name       = "csi-secrets-store"
  repository = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
  chart      = "secrets-store-csi-driver"
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
    aws_eks_addon.podidentity
  ]
}

# ------------------------------------------------------------------------------
# Install AWS Secrets Provider
# The GPS that tells postman where AWS Secrets Manager is
# ------------------------------------------------------------------------------
resource "helm_release" "aws_secrets_provider" {
  name       = "secrets-provider-aws"
  repository = "https://aws.github.io/secrets-store-csi-driver-provider-aws"
  chart      = "secrets-store-csi-driver-provider-aws"
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
    aws_eks_addon.podidentity,
    helm_release.secrets_store_csi_driver
  ]
}