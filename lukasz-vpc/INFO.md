# SIec i podsiec

## Usage

```tf
module "vpc" {
  source = "github.com/terraform-training/terraform-modules//lukasz-vpc?ref=main"
  name = "vpc_name"
  description = "nice description"
  routing_mode = "REGIONAL"

  subnets = {
    moja_podsiec_1 = {
        cidr = "172.19.10.0/24"
        region = "europe-west1"
        private_ip_google_access = true
    }
  }
}
```