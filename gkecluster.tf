resource "google_container_cluster" "gke-cluster" {
  name               = "challenge-gke-cluster"
  network            = "default"
  location           = "us-central1-c"
  initial_node_count = 1
}