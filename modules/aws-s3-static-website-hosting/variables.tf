variable "account_id" {
  type        = string
  description = "The AWS account ID to use for the Route53 zone"

}

variable "domain_name" {
  type        = string
  description = "The domain name to use for the Route53 zone"
}