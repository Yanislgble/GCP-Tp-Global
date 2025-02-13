#Le MIG va utiliser l’image créée via Packer dans le Projet Ops.

resource "google_compute_instance_template" "app_template" {
  name        = "app-template"
  machine_type = "e2-micro"
  region       = var.region

  disk {
    boot         = true
    auto_delete  = true
    source_image = var.image_name
  }

  network_interface {
    subnetwork = var.paris-app-prod_id
  }

  metadata_startup_script = file("install.sh")
}

resource "google_compute_region_instance_group_manager" "mig" {
  name = "app-mig"

  base_instance_name         = "app-instance"
  region       = var.region
  distribution_policy_zones  = ["${var.region}-a", "${var.region}-c"]

  version {
    instance_template = google_compute_instance_template.appserver.self_link_unique
  } 
}
