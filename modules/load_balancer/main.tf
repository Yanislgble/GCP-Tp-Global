#Réserver une adresse IP globale statique pour le Load Balancer :
resource "google_compute_global_address" "lb_ip" {
  name = "lb-ip"
}

#Définir comment le Load Balancer va envoyer le trafic aux instances du MIG :
resource "google_compute_backend_service" "backend" {
  name        = "app-backend"
  load_balancing_scheme = "EXTERNAL"
  protocol    = "HTTP"
  timeout_sec = 30

  backend {
    group = google_compute_instance_group_manager.mig.instance_group
  }
}

#Définir comment les requêtes entrantes sont traitées:
resource "google_compute_url_map" "url_map" {
  name        = "app-url-map"
  default_service = google_compute_backend_service.backend.id
}

#Intermédiaire entre le client et le backend :
resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "app-http-proxy"
  url_map = google_compute_url_map.url_map.id
}

#Associe l’IP globale (lb_ip) au Load Balancer.
resource "google_compute_global_forwarding_rule" "http_rule" {
  name       = "app-lb"
  target     = google_compute_target_http_proxy.http_proxy.id
  port_range = "80"
  ip_address = google_compute_global_address.lb_ip.address
}
