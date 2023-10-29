variable "zone_name" {
  type        = string
  description = "The name of the zone to create the records in"
}

variable "records" {
  type        = any
  description = "This is basically jsonencoded records due to a bug with terragrunt"
}

variable "environment" {
  type        = string
  description = "The environment of the resource"
}