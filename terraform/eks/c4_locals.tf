locals {
  # Business division (from variable)
  owners = var.business_division

  # Environment name (from variable)
  environment = var.environment_name

  # Combined prefix: "devops-dev"
  name = "${local.owners}-${local.environment}"

  # Full EKS cluster name: "devops-dev-platform-eks"
  eks_cluster_name = "${local.name}-${var.cluster_name}"
}