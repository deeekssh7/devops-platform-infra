locals {
  owners      = var.business_division
  environment = var.environment_name
  name        = "${local.owners}-${local.environment}"
}

# Get AWS Account ID
data "aws_caller_identity" "current" {}