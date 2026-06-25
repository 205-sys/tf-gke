resource "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.zone
  network    = var.network
  subnetwork = var.subnetwork

  deletion_protection = false

  remove_default_node_pool = true
  initial_node_count       = 1

  node_config {
    machine_type = "e2-small"
    disk_type    = "pd-standard"
    disk_size_gb = 50
  }
}

resource "google_container_node_pool" "nodes" {
  name     = "node-pool"
  cluster  = google_container_cluster.gke.name
  location = var.zone

  initial_node_count = 2

  node_config {
    machine_type = "e2-small"
    disk_type    = "pd-standard"
    disk_size_gb = 50
  }
}
