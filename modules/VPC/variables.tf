variable "project" {
  description = "ID-du-project-gcp"
  default     = "cloud-devops-yanisarthur-ops"
}

variable "vpc_name" {
  description = "Nom du VPC"
  type        = string
  default     = "vpc-prod"
}

variable "region" {
  description = "Région GCP"
  type        = string
  default     = "europe-west9"
}

variable "lb_subnet_cidr" {
  description = "CIDR du sous-réseau public"
  type        = string
  default     = "10.0.1.0/24"
}

variable "app_subnet_cidr" {
  description = "CIDR du sous-réseau privé"
  type        = string
  default     = "10.0.2.0/24"
}
