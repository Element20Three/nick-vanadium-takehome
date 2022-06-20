data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 18.0"
  cluster_name    = var.cluster_name
  cluster_version = "1.22"
  subnet_ids         = var.private_subnets

  vpc_id = var.vpc_id

  # EKS Managed Node Group(s)

  eks_managed_node_group_defaults = {
    disk_size      = 50
    instance_types = var.instance_types 
    root_volume_type = "standard"
  }

  eks_managed_node_groups = {
    green = {
      min_size  = 1
      max_size  = 2
      desired_size = 1
      instance_types = var.instance_types 
      capacity_type  = "SPOT"
    }
  }

}
