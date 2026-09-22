variable "region"{
    description = "Aws region"
    type = string
}

variable "vpc_name" {
  description = "Name of Vpc"
  type = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
}

variable "project" {
  description = "Name of Project"
  type =   string
}

variable "environment" {
  description = "Environment name"
  type        = string
}