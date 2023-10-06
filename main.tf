module "aws_ssm_parameter" {
    source = "./modules/aws-ssm-parameter"

    name = "tf-profile-provider"
}

