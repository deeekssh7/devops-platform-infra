# ------------------------------------------------------------------------------
# Create the AWS EKS Cluster (Control Plane)
# ------------------------------------------------------------------------------
resource "aws_eks_cluster" "main" {
  # Full cluster name: "devops-dev-platform-eks"
  name    = local.eks_cluster_name

  # Kubernetes version
  version = var.cluster_version

  # IAM role for EKS control plane (from c6)
  role_arn = aws_iam_role.eks_cluster.arn

  # VPC and networking configuration
  vpc_config {
    # Private subnets from VPC remote state (from c3)
    subnet_ids              = data.terraform_remote_state.vpc.outputs.private_subnet_ids

    # Allow kubectl from inside VPC
    endpoint_private_access = var.cluster_endpoint_private_access

    # Allow kubectl from internet (your laptop)
    endpoint_public_access  = var.cluster_endpoint_public_access

    # Who can access public endpoint
    public_access_cidrs     = var.cluster_endpoint_public_access_cidrs
  }

  # Kubernetes service IP range
  kubernetes_network_config {
    service_ipv4_cidr = var.cluster_service_ipv4_cidr
  }

  # Control plane logs → CloudWatch
  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  # Wait for IAM role + policies before creating cluster
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_vpc_resource_controller
  ]

  # Modern authentication config
  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  tags = var.tags
}