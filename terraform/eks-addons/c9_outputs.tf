# ------------------------------------------------------------------------------
# Pod Identity Addon
# ------------------------------------------------------------------------------
output "pod_identity_addon_id" {
  description = "Pod Identity Agent Addon ID"
  value       = aws_eks_addon.pod_identity.id
}

# ------------------------------------------------------------------------------
# EBS CSI Driver
# ------------------------------------------------------------------------------
output "ebs_csi_iam_role_arn" {
  description = "EBS CSI Driver IAM Role ARN"
  value       = aws_iam_role.ebs_csi_iam_role.arn
}

output "ebs_csi_addon_version" {
  description = "EBS CSI Addon version installed"
  value       = aws_eks_addon.ebs_csi.addon_version
}

# ------------------------------------------------------------------------------
# Load Balancer Controller
# ------------------------------------------------------------------------------
output "lbc_iam_role_arn" {
  description = "LBC IAM Role ARN"
  value       = aws_iam_role.lbc_iam_role.arn
}

output "lbc_iam_policy_arn" {
  description = "LBC IAM Policy ARN"
  value       = aws_iam_policy.lbc_iam_policy.arn
}

output "helm_lbc_metadata" {
  description = "LBC Helm Release Metadata"
  value       = helm_release.loadbalancer_controller.metadata
}

# ------------------------------------------------------------------------------
# Secret Store CSI Driver
# ------------------------------------------------------------------------------
output "helm_secrets_store_csi_metadata" {
  description = "Secrets Store CSI Driver Helm Metadata"
  value       = helm_release.secrets_store_csi_driver.metadata
}

output "helm_aws_secrets_provider_metadata" {
  description = "AWS Secrets Provider Helm Metadata"
  value       = helm_release.aws_secrets_provider.metadata
}

