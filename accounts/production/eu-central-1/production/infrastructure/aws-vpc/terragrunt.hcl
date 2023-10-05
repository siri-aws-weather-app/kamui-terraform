# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-vpc"
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
    vpc_name = "vpc-production"
    environment = "production"
}