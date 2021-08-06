resource "google_container_cluster" "k8s" {
  # provider = google-beta
  name     = local.name
  location = var.location # can be zonal or regional

  min_master_version = var.min_gke_version # GKE will autoupdate anyway!
  # node_version = var.gke_version

  network    = var.network
  subnetwork = var.subnetwork
  # enable_intranode_visibility = true # beta

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/20"
    services_ipv4_cidr_block = "/24"
  }
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  # other settings...

  # basic authentication will be disabled
  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = true # client certificate authorization is enabled
    }
  }
  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  # master_authorized_networks_config {
  #   cidr_blocks {
  #     cidr_block   = "XXX.201.153.118"
  #     display_name = "H"
  #   }
  # }

  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }
    network_policy_config {
      disabled = true
    }
    cloudrun_config {
      disabled = true
    }
    # istio_config {
    #   disabled = true # beta
    # }
    # dns_cache_config {
    #   enabled = true # beta
    # }
  }
  # network_policy {
  #   # if policy is enabled
  #   enabled  = "true"
  #   provider = "CALICO"
  # }
  # cluster_autoscaling {
  #  enabled = true
  #  resource_limits {
  #    resource_type = "cpu"
  #    minimum       = 1
  #    maximum       = 12
  #  }
  #  resource_limits {
  #    resource_type = "memory"
  #    minimum       = 2
  #    maximum       = 48
  #  }
  #}
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false # When false, either endpoint can be used!
    master_ipv4_cidr_block  = "10.255.255.0/28"
  }

  # cluster_telemetry {
  #   type = "ENABLE"  # can be SYSTEM_ONLY
  # }
  resource_labels = {
    "project" = var.environment
  }
  # Pandora's box!
  # workload_identity_config {
  #   identity_namespace = local.identity_namespace
  # }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "03:00"
    }
  }
}

