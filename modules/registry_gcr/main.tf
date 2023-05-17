resource "google_container_registry" "gcr" {
    project = var.config.project
    location = var.config.location
}

resource "google_storage_bucket_iam_member" "viewer" {
  bucket = google_container_registry.gcr.id
  role = var.config.role
  member = var.config.member
}