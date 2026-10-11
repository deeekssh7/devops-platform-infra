# Read secret from Secrets Manager
data "aws_secretsmanager_secret" "retailstore" {
  name = "retailstore-db-secret-1"
}

data "aws_secretsmanager_secret_version" "retailstore" {
  secret_id = data.aws_secretsmanager_secret.retailstore.id
}

locals {
  retailstore_secret_json = jsondecode(
    data.aws_secretsmanager_secret_version.retailstore.secret_string
  )
}