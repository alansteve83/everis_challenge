resource "google_container_cluster" "gke-cluster" {
  name               = "challenge-gke-cluster"
  network            = "default"
  location           = "$LOCATION"
  initial_node_count = 1
}