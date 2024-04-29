variable "region" {
  description = "AWS region for the EKS cluster"
  type        = string
}

variable "cluster" {
  description = "Context of k8s cluster"
  type        = string
}
