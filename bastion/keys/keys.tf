resource "tls_private_key" "access_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = var.bits
}

output "private_key" {
  value = tls_private_key.access_ssh_key.private_key_pem
}

output "public_key" {
  value = tls_private_key.access_ssh_key.public_key_openssh
}