# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-acm"
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
    acm_aws_region = "eu-central-1"
    role_arn = "arn:aws:iam::416023482452:role/development-role"
    domain_name = "api.development.siri-freyr.xyz"
    zone_id = "Z03308381C0X0VFA54659"
}