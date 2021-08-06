resource "google_container_node_pool" "primary_dedicated_nodes" {
  name     = "primary"
  location = var.location
  cluster  = google_container_cluster.k8s.name
  # node_count = var.nodes_per_zone
  initial_node_count = var.nodes_per_zone

  node_config {
    preemptible  = false
    machine_type = var.primary_nodepool_machine_type
    disk_size_gb = var.primary_nodepool_disk_size
    disk_type    = var.primary_nodepool_disk_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    # workload_metadata_config {
    #   node_metadata = "GKE_METADATA_SERVER"
    # }

    labels = {
      "node-pool" = "${var.environment}-primary"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_write",
      "https://www.googleapis.com/auth/source.read_only",
      "https://www.googleapis.com/auth/pubsub",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/ndev.clouddns.readwrite", # for external-dns
    ]

    tags = concat(["k8s-general", "k8s-nodes"], var.tags)

    service_account = google_service_account.k8s.email # the service account being used needs the roles/logging.logWriter and roles/monitoring.metricWriter roles.
  }

  autoscaling {
    min_node_count = var.primary_nodepool_min_size
    max_node_count = var.primary_nodepool_max_size
  }

  management {
    auto_repair  = var.primary_nodepool_auto_repair
    auto_upgrade = var.primary_nodepool_auto_upgrade
  }
}

output "k8s_dedicated_nodepool_label" {
  value = "${var.environment}-primary"
}

output "k8s_dedicated_id" {
  value = google_container_node_pool.primary_dedicated_nodes.id
}
