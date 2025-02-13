output "vpc_id" {
  description = "ID du VPC créé"
  value       = google_compute_network.vpc.name
}

output "paris-lb-prod_id" {
  description = "ID du sous-réseau Load balancer"
  value       = google_compute_subnetwork.paris-lb-prod.id
}

output "paris-app-prod_id" {
  description = "ID du sous-réseau privé"
  value       = google_compute_subnetwork.paris-app-prod.id
}
