# Specify the GCP Provider
  provider "google" {
    credentials = "${file("spinnaker-sa.json")}"
    project = var.project_id
    region  = var.region
  }

  # Create a GCS Bucket
  resource "google_storage_bucket" "generic-bucket" {
    name     = "rob-test-123"
    location = var.region
  }

output "bucket" {
  value = ["${google_storage_bucket.generic-bucket}"]

}



