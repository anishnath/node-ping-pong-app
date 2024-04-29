module "managed_grafana" {
  source = "../../tf-modules//grafana"

  main-region = var.region
  env_name    = var.env

  private_subnets = var.private_subnets
  sso_admin_group_id = var.sso_admin_group_id
}

module "prometheus" {
  source = "../../tf-modules///prometheus"

  main-region = var.region
  env_name    = var.env

  cluster_name      = var.cluster_name
  oidc_provider_arn = var.oidc_provider_arn
  vpc_id            = var.vpc_id
  private_subnets   = var.private_subnets
}

module "vpcendpoints" {
  source = "../../tf-modules//vpcendpoints"

  main-region = var.region
  env_name    = var.env

  vpc_id                    = var.vpc_id
  private_subnets           = var.private_subnets
  grafana_security_group_id = module.managed_grafana.security_group_id
}