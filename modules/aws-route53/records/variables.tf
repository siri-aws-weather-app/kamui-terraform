variable "zone_name" {
  type        = string
  description = "The name of the zone to create the records in"
}

variable "records" {
  type        = list(any)
  description = "The list of records to create"
}

variable "environment" {
  type        = string
  description = "The environment of the resource"
}