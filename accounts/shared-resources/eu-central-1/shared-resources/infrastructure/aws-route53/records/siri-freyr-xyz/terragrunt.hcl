# Terragrunt configuration

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Expose the base source path
  base_source = "${dirname(find_in_parent_folders())}/../modules/aws-route53/records"
}

# Set the location of Terraform configurations
terraform {
  source = local.base_source
}

inputs = {
  zone_name = "siri-freyr.xyz"
  records = jsonencode([
    {
      name = ""
      type = "A"
      alias = {
        name                   = "d2ns85ttpy0os7.cloudfront.net"
        zone_id                = "Z2FDTNDATAQYW2"
      }
    },
    {
      name = "www"
      type = "NS"
      ttl  = 172800
      records = [
        "ns-544.awsdns-04.net",
        "ns-1207.awsdns-22.org",
        "ns-147.awsdns-18.com",
        "ns-1853.awsdns-39.co.uk"
      ]
    },
    {
      name = "development"
      type = "NS"
      ttl  = 172800
      records = [
        "ns-1358.awsdns-41.org",
        "ns-690.awsdns-22.net",
        "ns-1962.awsdns-53.co.uk",
        "ns-467.awsdns-58.com"
      ]
    },
    {
      name = "staging"
      type = "NS"
      ttl  = 172800
      records = [
        "ns-943.awsdns-53.net",
        "ns-385.awsdns-48.com",
        "ns-2004.awsdns-58.co.uk",
        "ns-1229.awsdns-25.org"
      ]
    }
  ])
}