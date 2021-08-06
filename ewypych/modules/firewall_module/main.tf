resource "google_compute_firewall" "bastion_open_22" {
  name    = var.rule_name
  network = var.vpc_name

  allow {
    protocol = "tcp"
    ports    = [var.port_incoming]
  }

  source_ranges = [var.source_range]
  target_tags   = [var.network_tag]
}
