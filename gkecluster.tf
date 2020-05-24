resource "google_container_cluster" "gke-cluster" {
  name               = "challenge-gke-cluster"
  network            = "default"
  location           = var.zone
  initial_node_count = 1
}