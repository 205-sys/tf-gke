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

  network    = module.network.vpc_id
  subnetwork = module.network.subnet_id

}
module "network" {
  source      = "../../modules/network"
  vpc_name    = "gke-vpc"
  subnet_name = "gke-subnet"
  cidr        = "10.20.0.0/24"
  region      = var.region
}
