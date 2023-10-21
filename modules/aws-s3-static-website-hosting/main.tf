module "s3_static_website_hosting" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.domain_name
  acl    = "public-read"

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  attach_policy = true
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid : "PublicReadGetObject",
        Effect : "Allow",
        Principal : "*",
        Action : "s3:GetObject",
        Resource : "arn:aws:s3:::${var.domain_name}/*"
      }
    ]
  })

  cors_rule = [
    {
      allowed_headers = ["Authorization", "Content-Length"]
      allowed_methods = ["GET", "POST"]
      allowed_origins = ["https://${var.domain_name}"]
      max_age_seconds = 3000
    }
  ]

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }

  website = {
    index_document = "index.html"
  }
}

module "s3_non_www_redirect" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.domain_name}-redirect"
  acl    = "public-read"

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "arn:aws:iam::${var.account_id}:root"
        Action    = ["s3:GetObject", "s3:PutObject"],
        Resource  = "arn:aws:s3:::${var.domain_name}/*"
      },
      {
        Effect    = "Allow",
        Principal = "arn:aws:iam::${var.account_id}:root"
        Action    = ["s3:ListBucket"],
        Resource  = "arn:aws:s3:::${var.domain_name}/*"
      }
    ]
  })

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  website = {
    redirect_all_requests_to = {
      protocol  = "https"
      host_name = "{var.domain_name}"
    }
  }
}