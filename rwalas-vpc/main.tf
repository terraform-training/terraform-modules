module "vpc" {
  for_each = local.vpcs
  source   = "./vpc"

  vpcs = local.vpcs
}


module "codename" {
  source = "./codename"
  length = 2
}
