resource "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.region

  network    = var.network
  subnetwork = var.subnetwork

  deletion_protection = false  # ✅ IMPORTANT FIX

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "nodes" {
  name     = "node-pool"
  cluster  = google_container_cluster.gke.name
  location = var.region

  node_config {
    machine_type = "e2-micro"   # ✅ smaller VM

    disk_size_gb = 20            # ✅ reduce disk size
  }

  initial_node_count = 1          # ✅ only 1 node
}