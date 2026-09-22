terraform {
  backend "s3" {
    bucket       = "devops-platform-tfstate-292875192099"
    key          = "vpc/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    encrypt      = true
  }
}