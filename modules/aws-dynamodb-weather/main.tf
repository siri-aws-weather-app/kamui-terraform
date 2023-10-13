module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name     = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "id"

  attributes = [
    {
      name = "id"
      type = "N"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}