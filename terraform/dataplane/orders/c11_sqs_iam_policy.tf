resource "aws_iam_policy" "orders_sqs_policy" {
  name        = "${local.name}-orders-sqs-policy"
  description = "Allow orders service to use SQS"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sqs:SendMessage",
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ]
        Resource = aws_sqs_queue.orders_queue.arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "orders_sqs_attach" {
  policy_arn = aws_iam_policy.orders_sqs_policy.arn
  role       = aws_iam_role.orders_getsecrets.name
}