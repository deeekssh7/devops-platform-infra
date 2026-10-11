# IAM Policy for DynamoDB access
resource "aws_iam_policy" "cart_dynamodb_policy" {
  name        = "${local.name}-cart-dynamodb-policy"
  description = "Allow cart service to access DynamoDB"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:DeleteItem",
          "dynamodb:UpdateItem",
          "dynamodb:Query",
          "dynamodb:Scan"
        ]
        Resource = "arn:aws:dynamodb:us-east-1:${data.aws_caller_identity.current.account_id}:table/retailstore-cart*"
      }
    ]
  })
}

# IAM Role for cart pod
resource "aws_iam_role" "cart_dynamodb_role" {
  name               = "${local.name}-cart-dynamodb-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge(var.tags, {
    Name      = "${local.name}-cart-dynamodb-role"
    Component = "Cart DynamoDB"
  })
}

# Attach policy to role
resource "aws_iam_role_policy_attachment" "cart_dynamodb_attach" {
  policy_arn = aws_iam_policy.cart_dynamodb_policy.arn
  role       = aws_iam_role.cart_dynamodb_role.name
}

output "cart_dynamodb_role_arn" {
  value = aws_iam_role.cart_dynamodb_role.arn
}