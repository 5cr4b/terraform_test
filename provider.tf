terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.65.2"
    }
  }
}


provider "google" {
  project   = "dhp-project-ltd"
  region    = "asia-southeast1"
  zone    = "asia-southeast1-c"
}       