output "ecr_repository_urls" {
  description = "ECR repository URLs for all services"
  value = {
    for k, v in aws_ecr_repository.retail_store : k => v.repository_url
  }
}

output "ecr_repository_arns" {
  description = "ECR repository ARNs"
  value = {
    for k, v in aws_ecr_repository.retail_store : k => v.arn
  }
}