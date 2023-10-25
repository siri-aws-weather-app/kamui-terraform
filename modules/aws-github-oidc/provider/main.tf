module "github_oidc_provider" {
  source  = "terraform-module/github-oidc-provider/aws"
  version = "2.1.0"

  create_oidc_provider = true
  create_oidc_role     = false
}