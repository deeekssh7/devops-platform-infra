terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }

  backend "s3" {
    bucket       = "devops-platform-tfstate-292875192099"
    key          = "dataplane/cart/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    encrypt      = true
  }
}

provider "aws" {
  region = var.region
}

# Secondary provider for us-east-1
# DynamoDB must be in us-east-1 (cart app hardcoded!)
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}