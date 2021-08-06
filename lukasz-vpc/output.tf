output "self_link" {
  value = google_compute_network.vpc.self_link
}


output "subnets_list" {
  value = [
    for s in google_compute_subnetwork.subnet : s.id
  ]
}