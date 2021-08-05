resource "google_compute_subnetwork" "public" {
  for_each = var.cidr_config.subnets

  name                     = "${var.environment}-${each.value["name"]}-public"
  ip_cidr_range            = each.value["public"]
  region                   = each.key
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = true

  log_config {
    #  If log_config is present, flow logs are enabled
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
    metadata_fields      = []
  }
}

resource "google_compute_subnetwork" "private" {
  for_each = var.cidr_config.subnets

  name                     = "${var.environment}-${each.value["name"]}-private"
  ip_cidr_range            = each.value["private"]
  region                   = each.key
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = true # needs to be true for Stackdriver agent to work in private subnetworks

  log_config {
    #  If log_config is present, flow logs are enabled
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
    metadata_fields      = []
  }
}

output "private_subnetworks_list" {
  value = [for subnet in google_compute_subnetwork.private : subnet.self_link]
}

output "public_subnetworks_list" {
  value = [for subnet in google_compute_subnetwork.public : subnet.self_link]
}

output "private_subnetworks_map" {
  value = { for subnet in google_compute_subnetwork.private : subnet.region => subnet.self_link }
}

output "public_subnetworks_map" {
  value = { for subnet in google_compute_subnetwork.public : subnet.region => subnet.self_link }
}
