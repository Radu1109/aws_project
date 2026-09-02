module "vpc" {
  source             = "../../modules/network"
  vpc                = var.vpc_cidr
  subnet_public_1    = var.subnet_public_1
  subnet_public_2    = var.subnet_public_2
  subnet_private_1   = var.subnet_private_1
  subnet_private_2   = var.subnet_private_2
  availability_zones = var.availability_zones
}

module "eks" {
  source       = "../../modules/eks"
  cluster_name = var.cluster_name
  subnet_ids   = module.vpc.private_subnets
}