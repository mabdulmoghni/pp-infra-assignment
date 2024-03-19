################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "./modules/vpc"

  main-region = var.main-region
  profile     = var.profile
}

################################################################################
# EKS Cluster Module
################################################################################

module "eks" {
  source = "./modules/eks-cluster"

  main-region = var.main-region
  profile     = var.profile
  rolearn     = var.rolearn

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  
}

################################################################################
# AWS ALB Controller
################################################################################

module "aws_alb_controller" {
  source = "./modules/aws-alb-controller"

  main-region  = var.main-region
  env_name     = var.env_name
  cluster_name = var.cluster_name

  vpc_id            = module.vpc.vpc_id
  oidc_provider_arn = module.eks.oidc_provider_arn
}


################################################################################
# Database RDS
################################################################################
module "rds" {
  source = "./modules/rds"

  main-region = var.main-region
  profile     = var.profile
  vpc_id      = module.vpc.vpc_id
  #vpc_cidr_block  = module.vpc.private_subnets_cidr_blocks
  private_subnets = module.vpc.private_subnets
  #subnets = [
  #  "${module.vpc.private_subnets}",
  #]
  subnets = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]

}