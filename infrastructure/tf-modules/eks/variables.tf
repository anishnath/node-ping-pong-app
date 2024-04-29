variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
}

variable "region" {
  description = "AWS region for the EKS cluster"
  type        = string
}

variable "name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}


variable "k8s_version" {
  description = "EKS master version"
  type        = string
  default     = "1.21"
}
