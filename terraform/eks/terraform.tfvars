# AWS Region
region  = "ap-south-1"

# Environment & Project
environment_name  = "dev"
business_division = "devops"

# EKS Cluster
cluster_name              = "platform-eks"
cluster_version           = "1.29"
cluster_service_ipv4_cidr = "172.20.0.0/16"

# EKS Endpoint Access
cluster_endpoint_private_access      = false
cluster_endpoint_public_access       = true
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]

# Common Tags
tags = {
  Terraform   = "true"
  Project     = "devops-platform"
  Environment = "dev"
  Owner       = "Deeksha"
}

# Node Group
node_instance_types = ["t3.medium"]
node_capacity_type  = "ON_DEMAND"
node_disk_size      = 20