terraform {
    source = "../../../modules/aws-vpc"
}

inputs = {
    vpc_name = "vpc-development"
    environment = "development"
}