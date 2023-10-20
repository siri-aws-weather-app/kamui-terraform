# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-ecr-private"
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
    repository_name = "norns-weather-service"
}