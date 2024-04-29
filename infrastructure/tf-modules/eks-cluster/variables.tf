variable "region" {
  type = string
}

variable "cluster_name" {
    description = "Name of the EKS cluster"
    type        = string
}

variable "cluster_version" {
    description = "Version of the EKS cluster"
    type        = string
    default = "1.27"
}
variable "vpc_id" {
  description = "VPC ID which EKS cluster is deployed in"
  type        = string
}

variable "private_subnets" {
  description = "VPC Private Subnets which EKS cluster is deployed in"
  type        = list(any)
}

variable "rolearn" {
  description = "Add admin role to the aws-auth configmap"
  default = ""
}

variable "env" {
    description = "Environment"
    default = "dev"
}