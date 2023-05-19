terraform {
  required_version = "0.12.0"
  required_providers {
    google = ""
  }
}

provider "google" {
  project   = "dhp-project-ltd"
  region    = "asia-southeast1"
  zone    = "asia-southeast1-c"
}       