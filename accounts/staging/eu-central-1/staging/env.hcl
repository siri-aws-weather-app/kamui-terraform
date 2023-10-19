# Set common variables for the environment
locals {
  environment    = "staging"
  state_bucket   = "kamui-terraform-state-staging"
  dynamodb_table = "kamui-terraform-state-lock-staging"
  deps_layer_arn = ""
  utils_layer_arn = ""
  lambda_get_realtime_weather_arn = ""
}