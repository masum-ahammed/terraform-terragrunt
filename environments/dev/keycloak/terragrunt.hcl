

terraform {
  source = "../../../terraform-modules/keycloak"
}

dependency "eks" {
  config_path = "../eks"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# Inputs that you want to pass to your Terraform module
inputs = {
  image = "quay.io/keycloak/keycloak:23.0.3"
  replicas = 1
  keycloak_admin_user = "admin"
  keycloak_admin_password = "admin"
  keycloak_port = 80  # Default port, change as needed
  alb_ingress_annotations = {
    "kubernetes.io/ingress.class"                   = "alb"
    "alb.ingress.kubernetes.io/scheme"              = "internet-facing"
    "alb.ingress.kubernetes.io/target-type"         = "ip"
     # Health Check Settings
    "alb.ingress.kubernetes.io/healthcheck-protocol" =  "HTTP"
    "alb.ingress.kubernetes.io/healthcheck-port" = "traffic-port"
  },
  eks_cluster_id     = dependency.eks.outputs.eks_cluster_id
  eks_cluster_ca_certificate     = dependency.eks.outputs.cluster_ca_certificate
  eks_cluster_endpoint = dependency.eks.outputs.cluster_endpoint
}

