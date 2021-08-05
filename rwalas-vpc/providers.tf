provider "google" {
  credentials = file(var.plik_credentials)
  project     = var.projekt
  region      = var.region
}
