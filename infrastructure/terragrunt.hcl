locals {
  environment = get_env("ENVIRONMENT", "dev")
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "s3" {
    bucket         = "stardust-${local.environment}-tf-state"
    dynamodb_table = "stardust-${local.environment}-tf-state-lock"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
EOF
}
