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
        name  = "d2ns85ttpy0os7.cloudfront.net"
        zone_id = "Z2FDTNDATAQYW2"
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
    },
    {
      name = "norns"
      type = "A"
      alias = {
        name = "qr3gs2phpt.eu-central-1.awsapprunner.com"
        zone_id = "Z0334911C2FDI2Q9M4FZ"
      }
    },
    {
      name = "_b4e718b99382a7c520c145991eff9ecb.norns"
      type = "CNAME"
      ttl  = 300
      records = [
        "_431d5cf6b2d55939035041199f2a742f.myvvytqgqf.acm-validations.aws.",
      ]
    },
    {
      name = "_db6ba21b8d4c923e4f818d0ddc5d39d4.2a57j77vlfaz09ss1wnpklqkas4u8n9.norns"
      type = "CNAME"
      ttl  = 300
      records = [
        "_cc4cb4747c7f3a45fbe83597adceb48d.myvvytqgqf.acm-validations.aws",
      ]
    },
    {
      name = "_5b039c619e956ac398bfbdcd1461b81e.www.norns"
      type = "CNAME"
      ttl  = 300
      records = [
        "_a1a3750396e2609139e6f29211006ec6.myvvytqgqf.acm-validations.aws.",
      ]
    },
    {
      name = "api"
      type = "A"
      alias = {
        name = "d-a2pn0ep6xc.execute-api.eu-central-1.amazonaws.com"
        zone_id = "Z1U9ULNL0V5AJ3"
      }
    },
  ])
}