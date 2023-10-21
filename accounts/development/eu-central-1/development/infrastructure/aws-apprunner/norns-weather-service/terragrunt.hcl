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
  auto_scaling_configuration_arn = dependency.shared_config.outputs.auto_scaling_configuration_arn
  image_identifier = "360532638835.dkr.ecr.eu-central-1.amazonaws.com/norns-weather-service-development:v0.0.2-dev"
}