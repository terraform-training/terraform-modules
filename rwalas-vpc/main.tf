module "vpc" {
  #for_each = local.vpcs
  source   = "./vpc"

   = each.value.subnetworks
}

output "subnets" {
  value = module.vpc.subnets
}

# module "codename" {
#   source = "./codename"
#   length = 2
# }
