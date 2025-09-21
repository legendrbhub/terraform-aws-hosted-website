module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  region       = var.region
  cidr         = var.cidr
  Pubsub00     = var.Pubsub00
  Pubsub02     = var.Pubsub02
  Pubsub04     = var.Pubsub04
  Prisub01     = var.Prisub01
  Prisub03     = var.Prisub03
  Prisub05     = var.Prisub05
}

module "sg" {
  source        = "./modules/sg"
  project_name  = var.project_name
  region        = var.region
  image_id      = var.image_id
  instance_type = var.instance_type
  vpc_id        = module.vpc.vpc.VPCId
}

module "alb" {
  source                = "./modules/alb"
  project_name          = var.project_name
  region                = var.region
  cidr                  = var.cidr
  vpc_id                = module.vpc.vpc.VPCId
  alb_security_group_id = module.sg.sg.alb_sg_id
  public_subnet_ids     = [module.vpc.vpc.Pubsub00id, module.vpc.vpc.Pubsub02id, module.vpc.vpc.Pubsub04id]
}

module "asg" {
  source                = "./modules/asg"
  project_name          = var.project_name
  region                = var.region
  image_id              = var.image_id
  instance_type         = var.instance_type
  key_name              = var.key_name
  web_security_group_id = module.sg.sg.web_sg_id
  private_subnet_ids    = [module.vpc.vpc.Prisub01id, module.vpc.vpc.Prisub03id, module.vpc.vpc.Prisub05id]
  target_group_arns     = [module.alb.alb.target_group_arn]
}
