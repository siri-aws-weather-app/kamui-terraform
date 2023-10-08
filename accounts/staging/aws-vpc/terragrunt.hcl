terraform {
    source = "../../../modules/aws-vpc"
}

inputs = {
    vpc_name = "vpc-production"
    environment = "production"
}