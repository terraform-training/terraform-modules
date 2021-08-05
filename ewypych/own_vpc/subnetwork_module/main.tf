resource "google_compute_subnetwork" "subnetwork" {
  name = var.subnetwork_name
  region = var.region
  network = var.vpc_network
  ip_cidr_range = var.ip_cidr
}
