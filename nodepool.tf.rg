resource "google_container_node_pool" "extra-pool" {
  name               = "extra-node-pool"
  location           = "us-west2-b"
  cluster            = google_container_cluster.gke-cluster.name
  initial_node_count = 3
}
