locals {
  name               = "${var.environment}-k8s"
  identity_namespace = "${var.project_id}.svc.id.goog"
}
