resource "aws_ecr_repository" "retail_store" {
  for_each = local.services
  name                 = "retail-store/${each.value}"
  image_tag_mutability = "MUTABLE"

  
  
 image_scanning_configuration {
    scan_on_push = true
  }

  tags = merge(var.tags,{
    Name        = "retail-store-${each.value}"
    Environment = local.environment
  })

}

resource "aws_ecr_lifecycle_policy" "retail_store" {
for_each = aws_ecr_repository.retail_store
  repository = each.value.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep last 10 images and delete older ones"
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
      action = {
        type = "expire"
      }
    }]
  })
}