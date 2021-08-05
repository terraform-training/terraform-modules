locals {
  project_name      = var.project_name
  prefix            = "ewypych"
  subnetwork_prefix = "my-subnetwork"
  credential_file   = var.credential_file
  vpc_name          = "${local.prefix}-vpc"
  subnetworks_data = {
    "europe-west1-1" = {
      name       = "${local.prefix}-${local.subnetwork_prefix}-europe-west1-private"
      region     = "europe-west1"
      vpc        = module.vpc.vpc_name
      cidr_range = "10.100.1.0/24"
    },
    "europe-west1-2" = {
      name       = "${local.prefix}-${local.subnetwork_prefix}-europe-west1-public"
      region     = "europe-west1"
      vpc        = module.vpc.vpc_name
      cidr_range = "10.100.2.0/24"
    },
    "europe-west3" = {
      name       = "${local.prefix}-${local.subnetwork_prefix}-europe-west3-private"
      region     = "europe-west3"
      vpc        = module.vpc.vpc_name
      cidr_range = "10.100.3.0/24"
    },
  }
}
