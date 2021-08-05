resource "google_compute_network" "main" {
  project                 = var.project
  name                    = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
}
