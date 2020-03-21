terraform {
  backend "gcs" {
    bucket = "rg-gke-tf-demo-tfstate"
    credentials = "./creds/serviceaccount.json"
  }
}
