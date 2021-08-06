
resource "kubernetes_storage_class" "ssd" {
  metadata {
    name = "ssd"
  }
  storage_provisioner = "kubernetes.io/gce-pd"
  reclaim_policy      = "Retain"
  parameters = {
    type = "pd-ssd"
  }
  allow_volume_expansion = true
}
