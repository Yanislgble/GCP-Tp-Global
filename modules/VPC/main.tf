provider "google" {
  project = var.project
  region  = var.region
}

resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "paris-lb-prod" {
  name          = "${var.vpc_name}-load-balancer"
  ip_cidr_range = var.lb_subnet_cidr
  network       = google_compute_network.vpc.id
  region        = var.region
}

resource "google_compute_subnetwork" "paris-app-prod" {
  name          = "${var.vpc_name}-private"
  ip_cidr_range = var.app_subnet_cidr
  network       = google_compute_network.vpc.id
  region        = var.region
  private_ip_google_access = true
}
