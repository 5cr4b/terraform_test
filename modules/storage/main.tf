resource "google_storage_bucket" "static-site" {
  name          = var.storage_name
  location      = var.location
}