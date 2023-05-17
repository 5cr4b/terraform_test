resource "google_compute_subnetwork" "gcp_vpc_subnet" {
  name              = "${var.config.name}-${var.config.id}-${var.config.customer}"
  description       = "subnet in network1 vpc"
  region            = var.config.region
  network           = var.config.network
  ip_cidr_range = "10.2.0.0/16"  
}