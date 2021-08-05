module "vpc" {
  source      = "github.com/terraform-training/terraform-modules//vpc?ref=main"
  cidr_config = local.cidr_config
  environment = local.prefix
}

module "bastion" {
  source       = "github.com/terraform-training/terraform-modules//bastion?ref=main"
  environment  = local.prefix
  machine_type = local.machine_details.machine_type
  network      = module.vpc.self_link
  subnetwork   = lookup(module.vpc.private_subnetworks_map, var.region)
  tags         = ["ssh"]
}

resource "google_compute_firewall" "bastion_open_22" {
  name    = "${local.prefix}-allow-bastion-22"
  network = module.vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

output "bastion_address" {
  value = module.bastion.ip
}

output "private_key" {
  value     = module.bastion.private_key
  sensitive = true
}
