locals {
  project_name    = var.project_name
  prefix          = "${var.project_name}-ewypych-state"
  region          = var.region
  credential_file = var.credential_file
  buckets_names = {
    "terra_state" = {
      name          = "${local.prefix}-first"
      location      = upper(var.region)
      force_destroy = true
    },
  }
}
