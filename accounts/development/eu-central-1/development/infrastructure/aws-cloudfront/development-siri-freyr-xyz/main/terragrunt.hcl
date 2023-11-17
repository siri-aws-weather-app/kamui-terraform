# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-cloudfront"
}

dependency "s3_endpoint" {
  config_path = "../../../aws-s3/freyr-static-website-host"

  mock_outputs = {
    s3_bucket_website_endpoint = "siri-is-the-best-mockname"
  }
  mock_outputs_allowed_terraform_commands = ["destroy", "validate"]
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
    aliases = ["development.siri-freyr.xyz"]
    domain_name = "development.siri-freyr.xyz"
    origin_domain_name = dependency.s3_endpoint.outputs.s3_bucket_website_endpoint
    certificate_arn = "arn:aws:acm:us-east-1:360532638835:certificate/d1e290ed-fbde-4da3-8d6a-fd346b30cc89"
}