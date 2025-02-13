resource "google_compute_firewall" "allow_8080" {
  name    = "allow-8080"
  network = module.VPC.vpc_id

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["myapp"]
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = module.VPC.vpc_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-ssh"]
}
