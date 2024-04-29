locals {
  environment = get_env("ENVIRONMENT", "dev")
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "s3" {
    bucket         = "tf-state-bucket-${local.environment}-tf-state"
    dynamodb_table = "tf-state-bucket-${local.environment}-tf-state-lock"
    key            = "helm/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
EOF
}
