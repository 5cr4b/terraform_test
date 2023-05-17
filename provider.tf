terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.64.0"
    }
  }
}



provider "google" {
  project   = "dhp-project-ltd"
  region    = "asia-southeast1"
  zone    = "asia-southeast1-c"
  credentials = file("dhp-project-380812-8b2613d43230.json")
}       