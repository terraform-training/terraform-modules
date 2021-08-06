output "client_certificate" {
  value = google_container_cluster.k8s.master_auth.0.client_certificate
}

output "client_key" {
  value = google_container_cluster.k8s.master_auth.0.client_key
}

output "cluster_ca_certificate" {
  value = google_container_cluster.k8s.master_auth.0.cluster_ca_certificate
}

output "name" {
  value = google_container_cluster.k8s.name
}

output "cluster_public_endpoint" {
  value = google_container_cluster.k8s.private_cluster_config[0].public_endpoint
}

output "cluster_node_tags" {
  value = google_container_cluster.k8s.node_config[0].tags
}