# VPC Remote State
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "devops-platform-tfstate-292875192099"
    key    = "vpc/terraform.tfstate"
    region = "ap-south-1"
  }
}

# EKS Remote State
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "devops-platform-tfstate-292875192099"
    key    = "eks/terraform.tfstate"
    region = "ap-south-1"
  }
}