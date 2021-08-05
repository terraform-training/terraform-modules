# resource "google_compute_network" "vpc_network" {
#   for_each                = var.vpcs
#   name                    = each.key
#   auto_create_subnetworks = each.value.auto_create_subnetworks
# }

locals {
  all_subnets = flatten([
    for key, vpc in var.vpcs : [
      for subnet in vpc.subnetworks : {
        ip_cidr_range = subnet.ip_cidr_range
        name = subnet.name
        region = subnet.region
        vpc = key
      }
    ] 
  ])
}

output "subnets" {
  value = local.all_subnets
}

# resource "google_compute_subnetwork" "subnetworks" {
#   for_each      = var.vpcs
#   name          = each.value.subnetworks.name
#   ip_cidr_range = each.value.ip_cidr_range
#   region        = each.value.region
#   network       = google_compute_network.vpc_network[each.key].id
# }

variable "vpcs" {
  type = map
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
