variable "image" {
  description = "Docker image for Keycloak"
  default     = "quay.io/keycloak/keycloak:23.0.3"
}

variable "replicas" {
  description = "Number of replicas"
  default     = 1
}

variable "keycloak_admin_user" {
  description = "Keycloak admin username"
  default     = "admin"
}

variable "keycloak_admin_password" {
  description = "Keycloak admin password"
  default     = "admin"
}

variable "alb_ingress_annotations" {
  description = "Annotations for ALB ingress"
  type        = map(string)
  default = {
    "kubernetes.io/ingress.class"                   = "alb"
    "alb.ingress.kubernetes.io/scheme"              = "internet-facing"
    "alb.ingress.kubernetes.io/target-type"         = "ip"
  }
}

variable "keycloak_port" {
  description = "The port on which Keycloak will listen"
  type        = number
  default     = 8180
}

variable "eks_cluster_id" {}
variable "eks_cluster_ca_certificate" {}
variable "eks_cluster_endpoint" {}
