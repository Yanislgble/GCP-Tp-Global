variable "project_id" {
  type = string
}

source "googlecompute" "ubuntu" {
  project_id      = var.project_id
  source_image_family = "ubuntu-latest"
  machine_type    = "e2-medium"
  zone            = "europe-west1-b"
  image_name      = "packer-ubuntu"
  image_family    = "custom-ubuntu"
  disk_size       = "20"
}

build {
  sources = ["source.googlecompute.ubuntu"]

  provisioner "ansible" {
    playbook_file = "../ansible/playbook.yml"
  }
}
