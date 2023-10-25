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
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
    aliases = ["staging.siri-freyr.xyz"]
    domain_name = "staging.siri-freyr.xyz"
    origin_domain_name = dependency.s3_endpoint.outputs.s3_bucket_website_endpoint
    certificate_arn = "arn:aws:acm:us-east-1:525284627566:certificate/e1fd76a8-a210-4aa1-8862-f9f4cc8389c5"
}