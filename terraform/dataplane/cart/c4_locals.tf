locals {
  owners      = var.business_division
  environment = var.environment_name
  name        = "${local.owners}-${local.environment}"
}

# Pod Identity Assume Role Policy
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["pods.eks.amazonaws.com"]
    }
    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
  }
}

# Get AWS Account ID
data "aws_caller_identity" "current" {}