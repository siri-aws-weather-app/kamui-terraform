module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name     = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "city"
  range_key = "timestamp"

  attributes = [
    {
      name = "city"
      type = "S"
    },
    {
      name = "timestamp"
      type = "N"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}