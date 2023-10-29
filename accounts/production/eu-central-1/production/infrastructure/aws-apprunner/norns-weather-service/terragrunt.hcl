# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-apprunner/apprunner-norns"
}

dependency "shared_config" {
  config_path = "../shared-config"
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
  service_name = "norns-weather-service"
  create_custom_domain_association = true
  domain_name = "norns.siri-freyr.xyz"
  auto_scaling_configuration_arn = dependency.shared_config.outputs.auto_scaling_configuration_arn
  image_identifier = "875944587789.dkr.ecr.eu-central-1.amazonaws.com/norns-weather-service-production:v1.0.0"
}