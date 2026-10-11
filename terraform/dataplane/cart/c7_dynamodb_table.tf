resource "aws_dynamodb_table" "retailstore_cart" {
  provider     = aws.us_east_1
  name         = "retailstore-cart"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = merge(var.tags, {
    Name = "retailstore-cart"
  })
}

output "cart_dynamodb_table_name" {
  value = aws_dynamodb_table.retailstore_cart.name
}

output "cart_dynamodb_table_arn" {
  value = aws_dynamodb_table.retailstore_cart.arn
}