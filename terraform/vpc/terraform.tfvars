aws_region       = "ap-south-1"
environment_name = "dev"
vpc_cidr         = "10.0.0.0/16"
subnet_newbits   = 8

tags = {
  Terraform   = "true"
  Project     = "devops-platform"
  Environment = "dev"
  Owner       = "Deeksha"
}