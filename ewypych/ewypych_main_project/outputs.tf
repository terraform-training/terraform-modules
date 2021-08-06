output "bastion_address" {
  value = module.bastion.ip
}

output "private_key" {
  value     = module.bastion.private_key
  sensitive = true
}
