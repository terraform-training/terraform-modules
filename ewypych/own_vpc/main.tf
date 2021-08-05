module "vpc" {
  source   = "vpc_module"
  vpc_name = "ewypych-some-vpc"
  project = "ncs-main"
}

#module "subnetwork" {
#  for_each        = local.subnetworks_data
#  source          = "./subnetwork_module"
#  ip_cidr         = each.value.cidr_range
#  region          = each.value.region
#  subnetwork_name = each.value.name
#  vpc_network     = each.value.vpc
#}

