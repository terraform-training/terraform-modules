resource "google_compute_network" "vpc" {
  name                    = "${var.name}-vpc"
  description             = "${var.description}"
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
}

resource "google_compute_subnetwork" "subnet" {
  for_each                 = var.subnets
  name                     = each.key
  ip_cidr_range            = each.value["cidr"]
  region                   = each.value["region"]
  network                  = google_compute_network.vpc.id
  private_ip_google_access = each.value["private_ip_google_access"]
}


