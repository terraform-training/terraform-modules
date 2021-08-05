resource "google_compute_network" "vpc_network" {
  for_each                = toset(var.vpcs)
  name                    = each.key
  auto_create_subnetworks = each.value.auto_create_subnetworks
}

locals {
  subnetworks = {
    for subnetwork in var.vpc.subnetworks : subnetwork => {
      name = var.vpc.subnetworks.name
      ip_cidr_range = var.vpc.subnetworks.ip_cidr_range
      region = var.vpc.subnetworks.region
    }
  }
}

resource "google_compute_subnetwork" "subnetworks" {
  for_each      = toset(var.vpcs)
  name          = each.value.subnetworks.name
  ip_cidr_range = each.value.ip_cidr_range
  region        = each.value.region
  network       = google_compute_network.vpc_network[each.key].id
}

variable "vpcs" {
  type = object({})
    #type = object({
    #    name          = string
    #    ip_cidr_range = string
    #  })
  description = "Object containing subnetworks and their cidr range"
}

#output "vpc_names" {
#  value = {
#    for vpc in var.vpcs : vpc => {
#      name       = google_compute_network.vpc_network.name
#    }
#  }
#}
#
#output "subnetworks" {
#  value = {
#    for vpc in var.vpcs : vpc => {
#      name       = google_compute_subnetwork.subnetworks.name
#      cidr_range = google_compute_subnetwork.subnetworks.ip_cidr_range
#    }
#  }
#}
