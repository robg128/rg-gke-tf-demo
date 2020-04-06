provider "google" {
  credentials = "${file("spinnaker-sa.json")}"
  project     = "smiling-office-273317"
  region      = "us-central1"
  zone        = "us-central1-c"
}



resource "google_storage_bucket" "generic-bucket" {
  project =  "smiling-office-273317"
  name          = "rob-test-bucket"
  location      = "US"
  force_destroy = true
  lifecycle_rule {
    condition {
      age = "3"
    }
    action {
      type = "Delete"
    }
  }
}
