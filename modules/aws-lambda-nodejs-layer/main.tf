module "lambda_layer_s3" {
  source = "terraform-aws-modules/lambda/aws"

  create_layer = true

  layer_name          = var.layer_name
  description         = var.layer_description
  compatible_architectures	= ["x86_64"]
  compatible_runtimes	= ["nodejs18.x"]

  source_path = var.source_path

  store_on_s3 = true
  s3_bucket   = var.s3_bucket
}