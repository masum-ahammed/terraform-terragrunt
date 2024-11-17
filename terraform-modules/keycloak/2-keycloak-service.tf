resource "kubernetes_service_v1" "keycloak" {
  metadata {
    name      = "keycloak"
    namespace = "default"
  }

  spec {
    selector = {
      app = "keycloak"
    }

    type = "ClusterIP"

    port {
      name        = "http"
      protocol    = "TCP"
      port        = 80
      target_port = 8080
    #   node_port   = 30080  # Specify NodePort (optional, or let Kubernetes assign one)
    }
  }
}
