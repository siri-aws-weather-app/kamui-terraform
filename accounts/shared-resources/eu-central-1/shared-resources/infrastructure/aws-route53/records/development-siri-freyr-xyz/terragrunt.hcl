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
  zone_name = "development.siri-freyr.xyz"
  records = [
    {
      name = ""
      type = "A"
      alias = {
        name                   = "d174ryp0uq3o1p.cloudfront.net"
        zone_id                = "Z2FDTNDATAQYW2"
      }
    },
    {
      name = "_315f040b44677b554ac5c300efac2f0d.norns"
      type = "CNAME"
      ttl  = 300
      records = [
        "_f05ccdb3ff067d7b04d9234d42bed301.xpybkgmvdt.acm-validations.aws.",
      ]
    },
        {
      name = "_96b7aa139e7576886d4dac2ec769c91d.www.norns"
      type = "CNAME"
      ttl  = 300
      records = [
        "_61ce7e8c676a924364cf4d852732d212.xpybkgmvdt.acm-validations.aws.",
      ]
    },
    {
      name = "_f3a44dd37cb0e3a0913a58c57d4d5a85.2a57j77vlfaz09ss1wnpklqkas4u8n9.norns"
      type = "CNAME"
      ttl  = 300
      records = [
        "_0188be1f6fd09154a2d7a0a425839445.xpybkgmvdt.acm-validations.aws.",
      ]
    },
    {
      name = "norns"
      type = "CNAME"
      ttl  = 300
      records = [
        "yiqnmfh3z9.eu-central-1.awsapprunner.com",
      ]
    },
    {
      name = "api"
      type = "A"
      alias = {
        name                   = "d-02etw1w9b0.execute-api.eu-central-1.amazonaws.com"
        zone_id                = "Z1U9ULNL0V5AJ3"
      }
    },
  ]
}