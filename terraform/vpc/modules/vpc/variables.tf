variable "environment_name" {
  description = "Environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "subnet_newbits" {
  description = "New bits to add to VPC CIDR for subnets"
  type        = number
  default     = 8
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}