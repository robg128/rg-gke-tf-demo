provider "google" {
  credentials = file("./creds/serviceaccount.json")
  project     = "rg-gke-tf-demo"
  region      = "us-west2"
}
