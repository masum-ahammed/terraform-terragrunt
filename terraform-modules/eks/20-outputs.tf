output "eks_name" {
  value = aws_eks_cluster.this.name
}

output "eks_cluster_id" {
  value = aws_eks_cluster.this.id
}

output "openid_provider_arn" {
  value = aws_iam_openid_connect_provider.this[0].arn
}

output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "cluster_ca_certificate" {
  value = aws_eks_cluster.this.certificate_authority[0].data
}