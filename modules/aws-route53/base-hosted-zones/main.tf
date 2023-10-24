module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 2.0"

  zones = {
    "siri-freyr.xyz" = {
      comment = "Hosted Zone for siri-freyr.xyz"
      tags = {
        env = "production"
      }
    },
    "www.siri-freyr.xyz" = {
      comment = "Hosted Zone for www.siri-freyr.xyz"
      tags = {
        env = "production"
      }
    },
    "staging.siri-freyr.xyz" = {
      comment = "Hosted Zone for staging.siri-freyr.xyz"
      tags = {
        env = "staging"
      }
    },
    "development.siri-freyr.xyz" = {
      comment = "Hosted Zone for development.siri-freyr.xyz"
      tags = {
        env = "development"
      }
    }
  }
}