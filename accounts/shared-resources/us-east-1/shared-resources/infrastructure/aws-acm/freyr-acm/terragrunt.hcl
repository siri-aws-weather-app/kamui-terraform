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
    domain_name = "siri-freyr.xyz"
    zone_id = "Z095691014EJX51I256ZM"
    subject_alternative_names = ["*.siri-freyr.xyz"]
}