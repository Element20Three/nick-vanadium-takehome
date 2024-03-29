data "terraform_remote_state" "eks" {
  backend = var.cluster_id_depends_on == "takehome" ? "local" : ""

  config = {

    path = "./terraform.tfstate"
  }
}

data "aws_region" "current" {}

data "aws_eks_cluster" "cluster" {
  name = var.cluster_id_depends_on 
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      data.aws_eks_cluster.cluster.name
    ]
  }
}
