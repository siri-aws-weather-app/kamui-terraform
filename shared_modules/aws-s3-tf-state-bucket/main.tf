module "tf-state-bucket" {
    source = "../../modules/aws-s3-bucket"

    bucket_name = "kamui-terraform-state"
    tags = {
        Name = "Kamui Terraform State Bucket"
    }
}