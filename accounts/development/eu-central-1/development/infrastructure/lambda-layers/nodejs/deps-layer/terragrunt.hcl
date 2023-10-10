# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-lambda-nodejs-layer"
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
    layer_name = "deps-layer"
    layer_description = "Dependencies layer for the AWS Lambda function"
    s3_bucket = "siri-aws-lambda-layer-bucket"
    source_path = "${dirname(find_in_parent_folders())}/../aws-lambda/nodejs/dist/layers/deps-layer"
}