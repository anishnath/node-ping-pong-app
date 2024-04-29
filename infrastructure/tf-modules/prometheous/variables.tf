variable "profile" {
  type = string
}

variable "region" {
  type = string
}

variable "env_name" {
  type = string
}

variable "cluster_name" {
  type    = string
  default = "tf-cluster"
}

variable "oidc_provider_arn" {
  description = "OIDC Provider ARN used for IRSA "
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  description = "VPC ID which Load balancers will be  deployed in"
  type        = string
}

variable "private_subnets" {
  description = "Private subnets to create grafana workspace"
  type        = list(string)
}