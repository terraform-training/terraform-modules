module "bucket_module" {
  for_each      = local.buckets_names
  source        = "../modules/bucket_module"
  name          = each.value["name"]
  location      = each.value["location"]
  force_destroy = each.value["force_destroy"]
}

