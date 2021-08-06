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
  tags         = [local.machine_details.network_tag]
}

module "firewall" {
  source        = "../modules/firewall_module"
  network_tag   = local.machine_details.network_tag
  port_incoming = local.machine_details.allowed_port
  rule_name     = "${local.prefix}-allow-22"
  source_range  = local.machine_details.source_range
  vpc_name      = module.vpc.self_link
}

module "bucket_module" {
  for_each      = local.buckets_names
  source        = "../modules/bucket_module"
  name          = each.value["name"]
  location      = each.value["location"]
  force_destroy = each.value["force_destroy"]
}
