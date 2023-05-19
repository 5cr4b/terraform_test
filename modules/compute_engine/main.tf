resource "google_compute_instance" "gcp_compute_instance" {
  name          = "${var.config.name}-${var.config.customer}-${var.config.id}"
  project       = var.config.project
  machine_type  = var.config.machine_type
  zone          = var.config.zone
  tags          = ["",""]

  boot_disk {
    initialize_params {
      image  = var.config.image
      labels = {
        my_lables = var.config.my_lables
      }
    }
  }

  scratch_disk {
    interface = var.config.scratch_disk
  }

  network_interface {
    network = var.config.network
  }

  metadata = {
    name = ""
  }
  
  metadata_startup_script =  "echo hi > hi.txt"
  service_account {
    email   = var.config.email
    scopes  = ["cloud-platform"]
  }     
}