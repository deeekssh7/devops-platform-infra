# --------------------------------------------------------
# AWS Region
# --------------------------------------------------------
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

# --------------------------------------------------------
# Environment & Project Info
# --------------------------------------------------------
variable "environment_name" {
  description = "Environment name used in resource names and tags"
  type        = string
  default     = "dev"
}

variable "business_division" {
  description = "Business division this infrastructure belongs to"
  type        = string
  default     = "devops"
}

# --------------------------------------------------------
# EKS Cluster Configuration
# --------------------------------------------------------
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "platform-eks"
}

variable "cluster_version" {
  description = "Kubernetes version for EKS control plane"
  type        = string
  default     = "1.29"
}

variable "cluster_service_ipv4_cidr" {
  description = "Service CIDR for Kubernetes services"
  type        = string
  default     = "172.20.0.0/16"
}

variable "cluster_endpoint_private_access" {
  description = "Enable private access to EKS endpoint"
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access" {
  description = "Enable public access to EKS endpoint"
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "CIDRs allowed to access public EKS endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# --------------------------------------------------------
# Common Tags
# --------------------------------------------------------
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    Terraform   = "true"
    Project     = "devops-platform"
  }
}

# --------------------------------------------------------
# EKS Node Group Configuration
# --------------------------------------------------------
variable "node_instance_types" {
  description = "EC2 instance types for worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_capacity_type" {
  description = "ON_DEMAND or SPOT"
  type        = string
  default     = "ON_DEMAND"
}

variable "node_disk_size" {
  description = "Disk size in GiB for worker nodes"
  type        = number
  default     = 20
}