variable "region" {
  description = "Région GCP"
  type        = string
  default     = "europe-west9"
}

variable "paris-app-prod_id" {
  description = "ID du sous-réseau privé"
  type        = string
  default     = ""
}

variable "image_name" {
  description = "Nom de l'image utilisée par l'instance"
  type        = string
  default     = "https://www.googleapis.com/compute/v1/projects/cloud-devops-yanisarthur-ops/zones/europe-west9-b/disks/test-ubuntu-3"
}

variable "region1" {
  description = "Région GCP"
  type        = string
  default     = "europe-west9"
}
