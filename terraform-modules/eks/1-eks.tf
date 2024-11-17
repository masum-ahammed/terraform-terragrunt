

resource "aws_eks_cluster" "this" {
  name     = "${var.env}-${var.eks_name}"
  version  = var.eks_version
  role_arn = aws_iam_role.cluster.arn

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true  # Temporarily enable public access


    subnet_ids = var.subnet_ids
  }

  depends_on = [aws_iam_role_policy_attachment.cluster_policies]
}


provider "kubernetes" {
  host                   = aws_eks_cluster.this.endpoint
  token                  = data.aws_eks_cluster_auth.this.token
  cluster_ca_certificate = base64decode(aws_eks_cluster.this.certificate_authority[0].data)
}

data "aws_eks_cluster_auth" "this" {
  name = aws_eks_cluster.this.name
}
