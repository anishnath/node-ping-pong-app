variable "profile" {
  type = string
}

variable "region" {
  type = string
}

variable "env_name" {
  type = string
}

variable "private_subnets" {
  description = "Private subnets to create grafana workspace"
  type        = list(string)
}

variable "sso_admin_group_id" {
  description = "AWS_SSO Admin Group ID"
  type        = string
}