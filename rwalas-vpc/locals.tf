locals {
  prefix = "${var.projekt}-${module.codename.codename}"
  # np. ncs-main-phoenix

  vpcs = {
    "${local.prefix}-rwalas-vpc-1" = {
      auto_create_subnetworks = false
      subnetworks = {
        name          = "${local.prefix}-subnetwork-rwalas1"
        ip_cidr_range = "10.0.0.1"
        region        = var.region
      }
    }
    "${local.prefix}-rwalas-vpc-2" = {
      auto_create_subnetworks = false
      subnetworks = {
        name          = "${local.prefix}-subnetwork-rwalas2"
        ip_cidr_range = "10.0.0.2"
        region        = var.region
      }
    }
  }
}
