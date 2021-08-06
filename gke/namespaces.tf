resource "kubernetes_namespace" "monitoring" {
  for_each = var.namespaces
  metadata {
    annotations = each.value.annotations
    name        = each.value.name
  }
}

