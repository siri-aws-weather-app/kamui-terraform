# Set common variables for the environment
locals {
  environment = "development"
  state_bucket = "kamui-terraform-state-development"
  dynamodb_table = "kamui-terraform-state-lock-development"
  deps_layer_arn = "arn:aws:lambda:eu-central-1:360532638835:layer:deps-layer:6"
  utils_layer_arn = "arn:aws:lambda:eu-central-1:360532638835:layer:utils-layer:7"
  lambda_get_realtime_weather_arn = "arn:aws:lambda:eu-central-1:360532638835:function:getRealTimeWeather"
}