resource "kubernetes_ingress_v1" "keycloak" {
  metadata {
    name      = "keycloak-ingress"
    namespace = "default"
    annotations = merge(var.alb_ingress_annotations, {
      "alb.ingress.kubernetes.io/scheme"            : "internet-facing",
      "alb.ingress.kubernetes.io/healthcheck-path"  : "/health",
      "alb.ingress.kubernetes.io/target-type"       : "ip"
    })
  }

  spec {
    rule {
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = kubernetes_service_v1.keycloak.metadata[0].name
              port {
                number = var.keycloak_port
              }
            }
          }
        }
      }
    }
  }
}
