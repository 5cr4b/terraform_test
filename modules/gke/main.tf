resource "google_container_cluster" "primary" {
  name               = var.config.name
  location           = var.config.location
  initial_node_count = var.config.initial_node_count
  #resource_labels = "test"

  #pod_security_policy_config {
  #  enabled = true
  #}
  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
  #private_cluster_config  {
  #  enable_private_nodes = true
  #  enable_private_endpoint = true
  #}
  #workload_metadata_config {
  #  node_metadata = "GKE_METADATA"
  #}
  ip_allocation_policy {
    cluster_ipv4_cidr_block = "10.0.0.0/8"
  }
  
  node_config {
    service_account = var.config.service_account
    labels = {
      my_lables = var.config.my_lables
    } 
    oauth_scopes = [
     var.config.oauth_scopes
    ]
    tags = ["foo", "bar"]
  }
  network_policy {
    enabled = true
  }
}