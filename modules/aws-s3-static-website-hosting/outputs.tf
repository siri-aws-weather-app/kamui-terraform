output "s3_bucket_website_endpoint" {
  description = "The endpoint of the S3 bucket website"
  value       = module.s3_static_website_hosting.s3_bucket_website_endpoint
}