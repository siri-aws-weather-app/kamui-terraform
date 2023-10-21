# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-route53/records"
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
  zone_name = "development.siri-freyr.xyz"
  records = [
    {
      name = ""
      type = "A"
      alias = {
        name                   = "d174ryp0uq3o1p.cloudfront.net"
        zone_id                = "Z2FDTNDATAQYW2"
      }
    }
  ]
}