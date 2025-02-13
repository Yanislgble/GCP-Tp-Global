module "VPC" {
  source              = "./terraform/modules/VPC"
  vpc_name           = "app-vpc"
  region             = "europe-west9"
  app_subnet_cidr = "10.0.1.0/24"
  lb_subnet_cidr     = "10.0.2.0/24"
}

module "FW" {
  source = "./terraform/modules/FW"
  vpc_id = module.VPC.vpc_id
}

module "compute" {
  source            = "./terraform/modules/compute"
  region           = "europe-west9"
  paris-app-prod_id = module.VPC.paris-app-prod_id
  image_name       = "projects/my-project/global/images/myapp-image"
}

module "load_balancer" {
  source = "./terraform/modules/load_balancer"
}

