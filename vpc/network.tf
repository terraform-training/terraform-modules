resource "google_compute_network" "vpc_network" {
  name                    = "${var.environment}-vpc"
  description             = "Terraformed VPC for apps"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL" # can be "GLOBAL"
}

output "name" {
  value = google_compute_network.vpc_network.name
}
output "self_link" {
  value = google_compute_network.vpc_network.self_link
}
