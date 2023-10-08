terraform {
    source = "../../../modules/aws-vpc"
}

inputs = {
    vpc_name = "vpc-staging"
    environment = "staging"
}