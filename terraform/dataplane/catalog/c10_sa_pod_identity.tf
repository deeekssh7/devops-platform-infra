# ------------------------------------------------------------------------------
# Pod Identity Association for Catalog ServiceAccount
# Links catalog pod to IAM role for Secrets Manager access
# ------------------------------------------------------------------------------
resource "aws_eks_pod_identity_association" "catalog" {
  cluster_name    = data.terraform_remote_state.eks.outputs.eks_cluster_name
  namespace       = "default"
  service_account = "catalog"
  role_arn        = aws_iam_role.catalog_getsecrets.arn
}

output "catalog_sa_pod_identity_association_arn" {
  description = "Pod Identity Association ARN for Catalog"
  value       = aws_eks_pod_identity_association.catalog.association_arn
}