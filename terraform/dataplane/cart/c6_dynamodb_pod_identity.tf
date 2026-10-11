resource "aws_eks_pod_identity_association" "cart" {
  cluster_name    = data.terraform_remote_state.eks.outputs.eks_cluster_name
  namespace       = "default"
  service_account = "carts"
  role_arn        = aws_iam_role.cart_dynamodb_role.arn
}

output "cart_pod_identity_association_arn" {
  value = aws_eks_pod_identity_association.cart.association_arn
}