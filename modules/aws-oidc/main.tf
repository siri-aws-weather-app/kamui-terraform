module "github-oidc" {
  source  = "terraform-module/github-oidc-provider/aws?ref=tags/2.1.0"
  version = "~> 1"

  role_name	= var.role_name
  role_description	= var.role_description

  create_oidc_provider = true
  create_oidc_role     = true

  github_thumbprint	= var.github_thumbprint

  repositories              = var.repositories
  oidc_role_attach_policies = var.oidc_role_attach_policies
}