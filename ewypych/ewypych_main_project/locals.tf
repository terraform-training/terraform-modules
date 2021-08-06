locals {
  prefix          = "ewypych-bastion"
  credential_file = var.credential_file
  machine_details = {
    machine_type = "n2-standard-2"
    network      = module.vpc.self_link
    subnetwork   = module.vpc.public_subnetworks_list[0]
    region       = "europe-west1"
    network_tag  = "ssh"
    allowed_port = "22"
    source_range = "0.0.0.0/0"
  }
  buckets_names = {
    "terra_state" = {
      name          = "${local.prefix}-archives"
      location      = upper(var.region)
      force_destroy = true
    },
  }
  cidr_config = {
    "vpc_cidr" = {
      "global" = {
        "name" = "${local.prefix}-vpc"
        "cidr" = "10.102.0.0/16"
      }
    }
    "subnets" = {
      "europe-west4" = {
        "name"    = "${local.prefix}-europe-west4"
        "public"  = "10.102.0.0/20"
        "private" = "10.102.16.0/20"
      }
      "europe-west1" = {
        "name"    = "${local.prefix}-europe-west1"
        "public"  = "10.100.32.0/20"
        "private" = "10.100.48.0/20"
      }
    }
  }
}
