# VPC module

## CIDR config

CIDR config should be structured as follows:

```hcl
cidr_config = {
    "vpc_cidr" = {
        "global" = {
            "name" = "NAME"
            "cidr" = "10.100.0.0/16"
        }
    }
    "subnets" = {
        "GCP_REGION" = {
            "name" = "frankfurt"
            "public" = "10.100.0.0/20"
            "private" = "10.100.16.0/20"
        }
        "GCP_OTHER_REGION" = {
            "name" = "belgium"
            "public" = "10.100.32.0/20"
            "private" = "10.100.48.0/20"
        }
    }
}
```

## Example

```hcl
cidr_config = {
  "vpc_cidr" = {
    "global" = {
      "name" = "prod"
      "cidr" = "10.102.0.0/16"
    }
  }
  "subnets" = {
    "europe-west4" = {
      "name"    = "eemshaven"
      "public"  = "10.102.0.0/20"
      "private" = "10.102.16.0/20"
    }
    "europe-west1" = {
      "name" = "belgium"
      "public" = "10.100.32.0/20"
      "private" = "10.100.48.0/20"
    }
  }
}
```