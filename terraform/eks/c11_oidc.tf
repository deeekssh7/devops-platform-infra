# ------------------------------------------------------------------------------
# TLS Certificate for OIDC
# Gets the certificate from EKS cluster's OIDC issuer URL
# ------------------------------------------------------------------------------
data "tls_certificate" "eks" {
  url = aws_eks_cluster.main.identity[0].oidc[0].issuer
}

# ------------------------------------------------------------------------------
# OIDC Provider
# Connects EKS cluster to AWS IAM
# Allows pods to assume IAM roles
# ------------------------------------------------------------------------------
resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.main.identity[0].oidc[0].issuer

  tags = merge(var.tags, {
    Name = "${local.name}-oidc-provider"
  })
}