terraform {
  backend "gcs" {
    bucket  = "office-tf-state-2026-001"
    prefix  = "gke-dev"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "gke" {
  source       = "../../modules/gke"
  cluster_name = "dev-gke-cluster"
  region       = var.region
}
