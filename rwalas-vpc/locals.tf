locals {
  prefix = "${var.projekt}-rwalas"
  # np. ncs-main-phoenix

  vpcs = {
    "${local.prefix}-rwalas-vpc-1" = {
      auto_create_subnetworks = false
      subnetworks = {
        eemshaven = {
          name          = "${local.prefix}-subnetwork-rwalas1"
          ip_cidr_range = "10.0.1.0/24"
          region        = var.region
        }
        frankfurt = {
          name          = "${local.prefix}-subnetwork-rwalas2"
          ip_cidr_range = "10.0.2.0/24"
          region        = var.region
        }
      }
    }
    "${local.prefix}-rwalas-vpc-2" = {
      auto_create_subnetworks = false
      subnetworks = {
        frankfurt = {
          name          = "${local.prefix}-subnetwork-rwalas3"
          ip_cidr_range = "10.0.1.0/24"
          region        = var.region
        }
      }
    }
  }
}
