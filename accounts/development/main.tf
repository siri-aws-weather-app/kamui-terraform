module "aws_ssm_parameter" {
    source = "../../modules/aws-ssm-parameter"
}

module "tf-state-bucket" {
    source = "../../shared_modules/aws-s3-tf-state-bucket"
}

module "tf-state-lock" {
    source = "../../shared_modules/aws-dynamodb-tf-lock"
}