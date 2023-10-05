remote_state {
    backend = "s3"
    config = {
        bucket = "kamui-terraform-state"
        key = "terragrunt/env/${path_relative_to_include()}/terraform.tfstate"
        region = "eu-central-1"
        encrypt = true
        dynamodb_table = "kamui-terraform-state-lock"
    }
}

inputs = {
    vpc_name = "aws-vpc"
    cidr_block = "10.0.0.0/16"
}

terraform {
    source = "../modules/aws-vpc"
}