resource "google_compute_network" "gcp_vpc_network" {
  project                   =  var.config.project
  name                      =  "${var.config.name}-${var.config.customer}-${var.config.id}"
  description               =  "vpc network"
  auto_create_subnetworks   = false
  #mtu                       =  "1460" // default Maximum Transmission Unit in bytes
}


