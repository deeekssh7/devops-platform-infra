# ------------------------------------------------------------------------------
# EKS Pod Identity Agent Addon
# Allows pods to assume IAM roles to access AWS services
# ------------------------------------------------------------------------------
resource "aws_eks_addon" "pod_identity" {
  cluster_name                = local.eks_cluster_name
  addon_name                  = "eks-pod-identity-agent"
  addon_version               = "v1.0.0-eksbuild.1"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  tags = merge(var.tags, {
    Name = "${local.name}-pod-identity-addon"
  })
}