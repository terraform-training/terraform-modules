resource "google_compute_router" "cloud_router" {
  for_each = var.cidr_config["subnets"]

  name    = "${var.environment}-cloud-router-${each.value["name"]}"
  network = google_compute_network.vpc_network.name
  region  = each.key

  #   bgp {
  #     asn               = 64514
  #     advertise_mode    = "CUSTOM"
  #     advertised_groups = ["ALL_SUBNETS"]
  #     advertised_ip_ranges {
  #       range = "1.2.3.4"
  #     }
  #     advertised_ip_ranges {
  #       range = "6.7.0.0/16"
  #     }
  #   }

}

resource "google_compute_router_nat" "nat" {
  for_each                           = var.cidr_config["subnets"]
  name                               = "${var.environment}-nat-${each.value["name"]}"
  router                             = google_compute_router.cloud_router[each.key].name
  region                             = each.key
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ips                            = []
  drain_nat_ips                      = []

  subnetwork {
    name                    = google_compute_subnetwork.private[each.key].self_link
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}