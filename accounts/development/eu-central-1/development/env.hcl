# Set common variables for the environment
locals {
  environment = "development"
  state_bucket = "kamui-terraform-state-development"
  dynamodb_table = "kamui-terraform-state-lock-development"
}