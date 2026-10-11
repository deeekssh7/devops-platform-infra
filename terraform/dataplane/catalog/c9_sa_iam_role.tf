# IAM Role for Catalog Pod (to read secrets from Secrets Manager)
resource "aws_iam_role" "catalog_getsecrets" {
  name               = "${local.name}-catalog-getsecrets-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge(var.tags, {
    Name        = "${local.name}-catalog-getsecrets-role"
    Environment = var.environment_name
    Component   = "AWS Secrets Store CSI Driver ASCP"
  })
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "catalog_db_secret_attach" {
  policy_arn = aws_iam_policy.retailstore_db_secret_policy.arn
  role       = aws_iam_role.catalog_getsecrets.name
}

# Output
output "catalog_sa_getsecrets_role_arn" {
  description = "IAM Role ARN for Catalog to get secrets"
  value       = aws_iam_role.catalog_getsecrets.arn
}