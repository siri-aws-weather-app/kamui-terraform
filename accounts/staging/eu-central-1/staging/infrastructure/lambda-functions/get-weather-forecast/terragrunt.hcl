# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-lambda"

  # Read the lambda_vars.hcl file
  lambda_vars = read_terragrunt_config(find_in_parent_folders("lambda_vars.hcl"))

  # Extract vars from the lambda_vars.hcl file
  weather_api_key_secret_arn = local.lambda_vars.locals.weather_api_key_secret_arn
}

dependency "deps_layer" {
  config_path = "../../lambda-layers/nodejs/deps-layer"
}

dependency "utils_layer" {
  config_path = "../../lambda-layers/nodejs/utils-layer"
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
    function_name = "getWeatherForecast"
    function_description = "Get weather forecast data from WeatherApi"
    source_path = "${dirname(find_in_parent_folders())}/../aws-lambda/nodejs/dist/handlers/get-weather-forecast"
    s3_bucket = "aws-lambda-bucket-staging"
    runtime = "nodejs18.x"
    handler = "index.lambdaHandler"
    policies = [
      "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
    ]
    number_of_policies = 1

    deps_layer_arn = dependency.deps_layer.outputs.layer_arn
    utils_layer_arn = dependency.utils_layer.outputs.layer_arn

    weather_api_key_secret_arn = local.weather_api_key_secret_arn
}