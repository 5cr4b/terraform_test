resource "google_storage_bucket" "static-site" {
  name          = var.config.storage_name
  location      = var.config.location
}