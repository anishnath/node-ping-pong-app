variable "region" {
  type = string
}

variable "env" {
  type = string
}

variable "vpc_id" {
  description = "VPC ID which Load balancers will be  deployed in"
  type        = string
}

variable "private_subnets" {
  description = "Private subnets to create grafana workspace"
  type        = list(string)
}

variable "grafana_security_group_id" {
  description = "Grafana Security Group ID"
  type        = string
}
