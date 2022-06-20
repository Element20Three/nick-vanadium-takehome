
module "vpc" {
  cluster_name = "unqork-takehome"

  source = "./modules/vpc"
}

module "eks" {
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  cluster_name    = "unqork-takehome"
  instance_types  = ["t3a.micro"]

  source = "./modules/eks"
}

module "deployments" {
  cluster_id_depends_on = module.eks.cluster_id

  source = "./modules/deployments"
}

output "cluster_id" {
  value = module.eks.cluster_id
}

output "cluster_name" {
  value = module.eks.cluster_id
}

output "app_endpoint" {
  value = "http://${module.deployments.lb_ip}"
}

output "region" {
  value = module.vpc.region
}