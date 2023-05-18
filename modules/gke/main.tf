resource "google_container_cluster" "primary" {
  name               = var.config.name
  location           = var.config.location
  initial_node_count = var.config.number_node
  node_config {
    service_account = var.config
    oauth_scopes = [
     
    ]
    tags = ["foo", "bar"]
  }
}