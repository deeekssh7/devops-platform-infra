locals {
  owners      = var.business_division
  environment = var.environment_name
  name        = "${local.owners}-${local.environment}"

  eks_cluster_name = data.terraform_remote_state.eks.outputs.eks_cluster_name
  node_role_arn    = data.terraform_remote_state.eks.outputs.eks_node_instance_role_arn
  vpc_id           = data.terraform_remote_state.vpc.outputs.vpc_id
}