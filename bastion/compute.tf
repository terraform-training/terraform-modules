data "google_compute_zones" "available" {
}

resource "google_compute_instance" "bastion" {
  name                      = "${var.environment}-bastion"
  machine_type              = var.machine_type
  zone                      = element(data.google_compute_zones.available.names, 0)
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    access_config {
      # Include this section to give the VM an external ip address
    }
  }

  tags = var.tags

  metadata = {
    ssh-keys = "${var.user}:${module.key.public_key}"
  }

  metadata_startup_script = file("${path.module}/files/startup_script.sh")

  service_account {
    email = google_service_account.bastion.email
    # https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instances/set-scopes#--scopes
    scopes = [
      "https://www.googleapis.com/auth/devstorage.readonly",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/compute.readonly",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/pubsub",
      "https://www.googleapis.com/auth/source.read_only",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/bigquery",
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  labels                    = {}
  resource_policies         = []
}
