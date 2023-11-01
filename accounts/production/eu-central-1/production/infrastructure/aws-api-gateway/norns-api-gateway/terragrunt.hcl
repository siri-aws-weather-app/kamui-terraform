# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-api-gateway"
}

dependency "norns-acm" {
  config_path = "../../aws-acm/api-norns-acm"
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
  allow_origins = ["https://siri-freyr.xyz", "https://www.siri-freyr.xyz"]
  domain_name = "api.norns.siri-freyr.xyz"
  domain_name_certificate_arn = dependency.norns-acm.outputs.acm_certificate_arn
  integrations = {
    "GET /current-weather-data" = {
      integration_uri = "https://norns.siri-freyr.xyz/current-weather-data"
      integration_type = "HTTP_PROXY"
      integration_method = "GET"
    }

    "GET /forecast-data" = {
      integration_uri = "https://norns.siri-freyr.xyz/forecast-data"
      integration_type = "HTTP_PROXY"
      integration_method = "GET"
    }
  }
}