# Set common variables for the environment
locals {
  environment    = "production"
  state_bucket   = "kamui-terraform-state-production"
  dynamodb_table = "kamui-terraform-state-lock-production"
  deps_layer_arn = ""
  utils_layer_arn = ""
  lambda_get_realtime_weather_arn = ""
}