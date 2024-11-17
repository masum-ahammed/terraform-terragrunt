
data "aws_eks_cluster" "cluster" {
  name = var.eks_cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = var.eks_cluster_id
}

# Terraform Kubernetes Provider
provider "kubernetes" {
  host = var.eks_cluster_endpoint 
  cluster_ca_certificate = base64decode(var.eks_cluster_ca_certificate)
  token = data.aws_eks_cluster_auth.cluster.token
}