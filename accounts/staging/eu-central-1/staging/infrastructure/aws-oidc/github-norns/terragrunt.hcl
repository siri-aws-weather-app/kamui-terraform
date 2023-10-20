# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-oidc"
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
    repositories = ["siri-aws-web-app/norns-weather-service"]
    role_name = "github-norns"
    role_description = "Role for github actions to push to ECR to eu-central-1"
    oidc_role_attach_policies = ["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"]
}