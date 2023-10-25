# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-s3-static-website-hosting"
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
    account_id = "525284627566"
    domain_name = "staging.siri-freyr.xyz"
}