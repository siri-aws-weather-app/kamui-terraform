# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-github-oidc/role"
}

dependency "oidc_provider_arn" {
  config_path = "../github-oidc-provider"
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
    repositories = ["siri-aws-web-app/freyr-weather-app"]
    role_name = "github-freyr"
    role_description = "Role for github actions to sync with S3 Static Website"
    oidc_role_attach_policies = ["arn:aws:iam::aws:policy/AmazonS3FullAccess"]
    oidc_provider_arn = dependency.oidc_provider_arn.outputs.oidc_provider_arn
}