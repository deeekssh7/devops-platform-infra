terraform {
  # Minimum Terraform version required
  required_version = ">= 1.10.0"

  # Which providers we need
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }

    tls = {                    
    source  = "hashicorp/tls"
    version = ">= 4.0"
  }
  }

  

  # Where to store state file
  backend "s3" {
    bucket       = "devops-platform-tfstate-292875192099"
    key          = "eks/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    encrypt      = true
  }
}

provider "aws" {
  region = var.region
}