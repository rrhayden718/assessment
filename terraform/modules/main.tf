module "network" {
  source          = "./modules/network"
  customer    = var.customer
  environment = var.environment
  project     = var.project
  owner       = var.owner
  vpc_cidr        = var.vpc_cidr
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
}

 module "ecs" {
   source                  = "./modules/ecs"
   vpc_id                  = "${module.network.vpc_id}"
   ecs_subnets             = "${momodule.network.private_subnet_ids}"
   customer                = var.customer
   environment             = var.environment
   project                 = var.project
   owner                   = var.owner
 }


# module "adc" {
#   source                  = "./adc"
#   vpc_id                  = "${module.network.vpc_id}"
#   domain_name             = var.domain_name
#   password                = var.password
#   size                    = var.size
#   customer_dns_ips        = var.customer_dns_ips
#   customer_username       = var.customer_username
#   subnet_ids              = [module.network.private_subnet_ids[0],module.network.private_subnet_ids[1]]
#   customer                = var.customer
#   environment             = var.environment
#   owner                   = var.owner
# }

# module "workspaces" {
#   source                  = "./workspaces"
#   directory_id            = "${module.adc.directory_id}"
#   subnet_ids              = [module.network.private_subnet_ids[0],module.network.private_subnet_ids[1]]
#   security_group_id       = module.adc.security_group_id
#   customer_username       = var.customer_username
#   compute_type_name       = var.compute_type_name
#   user_volume_size_gib    = var.user_volume_size_gib
#   root_volume_size_gib    = var.root_volume_size_gib
#   running_mode            = var.running_mode
#   default_ou              = var.default_ou
#   bundle_id               = var.bundle_id
# }