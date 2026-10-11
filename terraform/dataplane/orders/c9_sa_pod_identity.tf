resource "aws_eks_pod_identity_association" "orders" {
  cluster_name    = data.terraform_remote_state.eks.outputs.eks_cluster_name
  namespace       = "default"
  service_account = "orders"
  role_arn        = aws_iam_role.orders_getsecrets.arn
}

output "orders_pod_identity_association_arn" {
  value = aws_eks_pod_identity_association.orders.association_arn
}