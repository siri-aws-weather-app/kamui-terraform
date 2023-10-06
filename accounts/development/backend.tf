terraform {
  backend "s3" {
    bucket = "kamui-terraform-state"
    key = "terragrunt/account/development/terraform.tfstate"
    region = "eu-central-1"
    encrypt = true
    dynamodb_table = "kamui-terraform-state-lock"
    profile = "Admin1DevAdministratorAccess"
  }
}