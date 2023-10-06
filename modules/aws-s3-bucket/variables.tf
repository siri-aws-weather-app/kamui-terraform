variable "bucket_name" {
  description = "Name of the S3 bucket"
  type = string
  default = "my-bucket"
}

variable "acl" {
  description = "Access control list for the S3 bucket"
  type = string
  default = "private"
}

variable "tags" {
  description = "Tags to attach to the S3 bucket"
  type = map(string)
  default = {}
}

variable "object_ownership" {
  description = "Owenership rule for the S3 bucket"
  type = string
  default = "BucketOwnerPreferred"
}