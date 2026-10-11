resource "aws_iam_policy" "retailstore_db_secret_policy" {
  name        = "${local.name}-retailstore-db-secret-policy"
  description = "Allows access to retailstore-db-secret in Secrets Manager"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Resource = "arn:aws:secretsmanager:${var.region}:${data.aws_caller_identity.current.account_id}:secret:retailstore-db-secret*"
      }
    ]
  })
}