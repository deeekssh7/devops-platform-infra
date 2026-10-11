resource "aws_sqs_queue" "orders_queue" {
  name                      = "retailstore-orders"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  tags = merge(var.tags, {
    Name = "retailstore-orders-queue"
  })
}

output "orders_sqs_queue_url" {
  value = aws_sqs_queue.orders_queue.url
}

output "orders_sqs_queue_arn" {
  value = aws_sqs_queue.orders_queue.arn
}