# Set common variables for the environment
locals {
  environment    = "staging"
  state_bucket   = "kamui-terraform-state-staging-us-east-1"
  dynamodb_table = "kamui-terraform-state-lock-staging-us-east-1"
}