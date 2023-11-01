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
  zone_name = "staging.siri-freyr.xyz"
  records = [
    {
      name = ""
      type = "A"
      alias = {
        name                   = "d2a0z511pdbhf1.cloudfront.net"
        zone_id                = "Z2FDTNDATAQYW2"
      }
    },
    {
      name = "_71573ad8d270ec29e9ebf19ac2d12a7f.norns"
      type = "CNAME"
      ttl  = 300
      records = [
        "_1c74df55743399781b76488252ac2151.xpybkgmvdt.acm-validations.aws.",
      ]
    },
    {
      name = "_7c33c6e3f6a4bdcb96d1018c0f50bb3a.2a57j77vlfaz09ss1wnpklqkas4u8n9.norns"
      type = "CNAME"
      ttl  = 300
      records = [
        "_d8cd5dbc6b69dcacc6f40eab9794adaa.xpybkgmvdt.acm-validations.aws.",
      ]
    },
    {
      name = "_21f1a1ba9682d1344075e6075f9b8971.www.norns"
      type = "CNAME"
      ttl  = 300
      records = [
        "_99eae7d9da498e82d8533c4c59fd0539.xpybkgmvdt.acm-validations.aws.",
      ]
    },
    {
      name = "norns"
      type = "CNAME"
      ttl  = 300
      records = [
        "iddtztrt84.eu-central-1.awsapprunner.com",
      ]
    },
    {
      name = "api"
      type = "A"
      alias = {
        name                   = "d-g5t2ro42e5.execute-api.eu-central-1.amazonaws.com"
        zone_id                = "Z1U9ULNL0V5AJ3"
      }
    },
  ]
}