terraform {
  required_version = "0.13.0"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  project   = "dhp-project-ltd"
  region    = "asia-southeast1"
  zone    = "asia-southeast1-c"
}       