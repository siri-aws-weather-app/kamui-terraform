# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-route53/base-hosted-zones"
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}