remote_state {
    backend = "s3"
    generate = {
        path      = "backend.tf"
        if_exists = "overwrite"
    }
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
}