resource "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.region

  network    = var.network
  subnetwork = var.subnetwork

  remove_default_node_pool = true
  initial_node_count       = 1
}


resource "google_container_node_pool" "primary_nodes" {
  name       = "node-pool"
  cluster    = google_container_cluster.gke.name
  location   = var.region

  node_config {
    machine_type = "e2-medium"
  }

  initial_node_count = 2
}
