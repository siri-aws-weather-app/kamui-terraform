# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-eventbridge-weather-lambda-trigger"
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
  get_real_time_weather_lambda_arn = "arn:aws:lambda:eu-central-1:875944587789:function:getRealTimeWeather"
  get_weather_forecast_lambda_arn = "arn:aws:lambda:eu-central-1:875944587789:function:getWeatherForecast"
}