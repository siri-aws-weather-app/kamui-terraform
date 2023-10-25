# Set common variables for the environment
locals {
  environment    = "production"
  state_bucket   = "kamui-terraform-state-production-us-east-1"
  dynamodb_table = "kamui-terraform-state-lock-production-us-east-1"
}