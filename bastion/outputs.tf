output "ip" {
  value = google_compute_instance.bastion.network_interface.0.access_config.0.nat_ip
}

output "private_key" {
  value = module.key.private_key
}

output "public_key" {
  value = module.key.public_key
}