resource "google_compute_firewall" "linkerd" {
  # see https://linkerd.io/2/reference/cluster-configuration/#private-clusters
  name    = "${local.name}-gke-to-linkerd-control-plane"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["8443", "8089"]
  }

  source_ranges = [
    "10.255.255.0/28",
  ]

  target_tags = ["k8s-nodes"]
}

