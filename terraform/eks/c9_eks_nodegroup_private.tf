# ------------------------------------------------------------------------------
# EKS Managed Node Group — Worker Nodes in Private Subnets
# ------------------------------------------------------------------------------
resource "aws_eks_node_group" "private_nodes" {

  # Which cluster these nodes belong to
  cluster_name = aws_eks_cluster.main.name

  # Name of this node group
  node_group_name = "${local.name}-private-ng"

  # IAM role for worker nodes (from c8)
  node_role_arn = aws_iam_role.eks_nodegroup_role.arn

  # Launch nodes in private subnets (from VPC remote state)
  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids

  # EC2 instance type
  instance_types = var.node_instance_types

  # ON_DEMAND or SPOT
  capacity_type = var.node_capacity_type

  # Amazon Linux 2023 — latest AWS optimized OS for EKS
  ami_type = "AL2023_x86_64_STANDARD"

  # Root volume size
  disk_size = var.node_disk_size

  # Auto scaling configuration
  scaling_config {
    desired_size = 2   # Start with 2 nodes
    min_size     = 1   # Never go below 1
    max_size     = 3   # Never go above 3
  }

  # How many nodes can be unavailable during update
  update_config {
    max_unavailable_percentage = 33
  }

  # Force update when new AMI available
  force_update_version = true

  # Labels on each node — useful for pod scheduling
  labels = {
    "env"  = var.environment_name
    "team" = var.business_division
  }

  # Tags for node group and EC2 instances
  tags = merge(var.tags, {
    Name        = "${local.name}-private-ng"
    Environment = var.environment_name
  })

  # Wait for IAM policies before creating nodes
  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.eks_ecr_policy
  ]
}