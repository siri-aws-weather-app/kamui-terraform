variable "layer_name" {
    type        = string
    description = "The name of the layer"
}

variable "layer_description" {
    type        = string
    default    = "A layer for the lambda function"
    description = "The description of the layer"
}

variable "s3_bucket" {
    type        = string
    description = "The name of the S3 bucket"
}

variable "source_path" {
    type        = string
    description = "The source path of the file to upload to s3"
}