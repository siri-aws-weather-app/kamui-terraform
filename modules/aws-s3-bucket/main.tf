resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  tags = var.tags
}

resource "aws_s3_bucket_ownership_controls" "main" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = var.object_ownership
  }
}

resource "aws_s3_bucket_acl" "main" {
  depends_on = [aws_s3_bucket_ownership_controls.main]

  bucket = aws_s3_bucket.bucket.id
  acl = var.acl
}