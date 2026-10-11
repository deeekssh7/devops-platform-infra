# ------------------------------------------------------------------------------
# EKS Cluster Name
# ------------------------------------------------------------------------------
output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.main.name
}


output "eks_cluster_id" {
  description = "EKS cluster ID"
  value       = aws_eks_cluster.main.id
}
# ------------------------------------------------------------------------------
# EKS Cluster Endpoint
# Used by kubectl to connect to cluster
# ------------------------------------------------------------------------------
output "eks_cluster_endpoint" {
  description = "EKS API server endpoint"
  value       = aws_eks_cluster.main.endpoint
}

# ------------------------------------------------------------------------------
# EKS Cluster Version
# ------------------------------------------------------------------------------
output "eks_cluster_version" {
  description = "Kubernetes version"
  value       = aws_eks_cluster.main.version
}

# ------------------------------------------------------------------------------
# Certificate Authority Data
# Needed for kubectl authentication
# ------------------------------------------------------------------------------
output "eks_cluster_certificate_authority_data" {
  description = "Base64 encoded CA certificate"
  value       = aws_eks_cluster.main.certificate_authority[0].data
}

# ------------------------------------------------------------------------------
# Node Group Name
# ------------------------------------------------------------------------------
output "private_node_group_name" {
  description = "Name of private node group"
  value       = aws_eks_node_group.private_nodes.node_group_name
}

# ------------------------------------------------------------------------------
# Node Group IAM Role ARN
# Needed for IRSA setup later
# ------------------------------------------------------------------------------
output "eks_node_instance_role_arn" {
  description = "IAM Role ARN for worker nodes"
  value       = aws_iam_role.eks_nodegroup_role.arn
}

# ------------------------------------------------------------------------------
# kubectl config command
# Copy paste this after apply to connect kubectl!
# ------------------------------------------------------------------------------
output "to_configure_kubectl" {
  description = "Run this command to connect kubectl to your cluster"
  value       = "aws eks --region ${var.region} update-kubeconfig --name ${local.eks_cluster_name}"
}


# output "eks_oidc_provider_arn" {
#   description = "OIDC Provider ARN"
#   value       = aws_iam_openid_connect_provider.eks.arn
# }

# output "eks_oidc_provider_url" {
#   description = "OIDC Provider URL"
#   value       = aws_iam_openid_connect_provider.eks.url
# }

output "eks_cluster_security_group_id" {
  description = "EKS Cluster Security Group ID"
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}