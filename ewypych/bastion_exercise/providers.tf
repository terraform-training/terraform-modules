provider "google" {
  credentials = file(var.credential_file)
  project     = var.project_name
  region      = var.region
}
