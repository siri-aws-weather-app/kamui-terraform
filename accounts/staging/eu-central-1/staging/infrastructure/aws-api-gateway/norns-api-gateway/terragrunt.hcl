# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-api-gateway"
}

dependency "api-acm" {
  config_path = "../../aws-acm/api-acm"
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
  # Set the API Gateway name
  name = "norns-api-gateway"
  description = "Norns API Gateway"
  allow_methods = ["GET"]
  allow_origins = ["*"]
  domain_name = "api.staging.siri-freyr.xyz"
  domain_name_certificate_arn = dependency.api-acm.outputs.acm_certificate_arn
  integrations = {
    "GET /current-weather-data" = {
      integration_uri = "https://norns.staging.siri-freyr.xyz/current-weather-data"
      integration_type = "HTTP_PROXY"
      integration_method = "GET"
    }

    "GET /forecast-data" = {
      integration_uri = "https://norns.staging.siri-freyr.xyz/forecast-data"
      integration_type = "HTTP_PROXY"
      integration_method = "GET"
    }
  }
}