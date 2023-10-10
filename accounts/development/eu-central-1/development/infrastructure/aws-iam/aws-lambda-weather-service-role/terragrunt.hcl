# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-lambda-weather-service-role"
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
    trusted_role_services = [
        "lambda.amazonaws.com"
    ]
    role_name = "lambda-weather-service-role"
    custom_role_policy_arns = [
        "arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess"
    ]
}