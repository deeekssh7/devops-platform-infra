variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "environment_name" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_newbits" {
  description = "New bits for subnet calculation"
  type        = number
  default     = 8
}

variable "tags" {
  description = "Tags for all resources"
  type        = map(string)
  default = {
    Terraform   = "true"
    Project     = "devops-platform"
    Owner       = "Deeksha"
  }
}