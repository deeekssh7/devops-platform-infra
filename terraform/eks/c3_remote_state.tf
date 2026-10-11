data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "devops-platform-tfstate-292875192099"
    key    = "vpc/terraform.tfstate"
    region = var.region
  }
}

output "vpc_id" {
  value = data.terraform_remote_state.vpc.outputs.vpc_id
}

output "private_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.private_subnet_ids
}

output "public_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.public_subnet_ids
}