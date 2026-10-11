variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "environment_name" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "business_division" {
  description = "Business division"
  type        = string
  default     = "devops"
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