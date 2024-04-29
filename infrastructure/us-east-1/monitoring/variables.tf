variable "region" {
  type    = string
  default = "us-east-1"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "cluster_name" {
  type    = string
  default = "tf-cluster"
}

variable "cluster_endpoint" {
  type        = string
  sensitive   = true
  description = "The cluster endpoint"
}

variable "cluster_certificate_authority_data" {
  type        = string
  sensitive   = true
  description = "The Cluster certificate data"
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
  description = "A list of private subnets"
  type        = list(string)
}


variable "sso_admin_group_id" {
  description = "AWS_SSO Admin Group ID"
  type        = string
  sensitive   = true
}