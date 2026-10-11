# IAM Role for Orders pod
resource "aws_iam_role" "orders_getsecrets" {
  name               = "${local.name}-orders-getsecrets-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge(var.tags, {
    Name      = "${local.name}-orders-getsecrets-role"
    Component = "AWS Secrets Store CSI Driver ASCP"
  })
}

# Attach secrets policy to role
resource "aws_iam_role_policy_attachment" "orders_db_secret_attach" {
  policy_arn = aws_iam_policy.retailstore_db_secret_policy.arn
  role       = aws_iam_role.orders_getsecrets.name
}

output "orders_sa_getsecrets_role_arn" {
  value = aws_iam_role.orders_getsecrets.arn
}