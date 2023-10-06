terraform {
  backend "s3" {
    bucket = "kamui-terraform-state"
    key = "terraform/account/development/terraform.tfstate"
    region = "eu-central-1"
    encrypt = true
    dynamodb_table = "kamui-terraform-state-lock"
  }
}