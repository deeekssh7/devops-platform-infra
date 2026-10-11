# AWS Region
variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

# Environment
variable "environment_name" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

# Business Division
variable "business_division" {
  description = "Business division"
  type        = string
  default     = "devops"
}

# Common Tags
variable "tags" {
  description = "Tags for all resources"
  type        = map(string)
  default = {
    Terraform = "true"
    Project   = "devops-platform"
    Owner     = "Deeksha"
  }
}

# variable "eks_cluster_endpoint" {
#   description = "EKS cluster endpoint"
#   type        = string
# }

# variable "eks_cluster_ca" {
#   description = "EKS cluster CA certificate"
#   type        = string
# }

# variable "eks_cluster_name" {
#   description = "EKS cluster name"
#   type        = string
# }