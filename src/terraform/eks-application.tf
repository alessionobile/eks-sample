resource "kubernetes_deployment" "application" {
  depends_on = [helm_release.postgresql]

  metadata {
    name = var.application_container_name
    labels = {
      App = "eks-sample-${var.application_container_name}"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = "eks-sample-${var.application_container_name}"
      }
    }
    template {
      metadata {
        labels = {
          App = "eks-sample-${var.application_container_name}"
        }
      }
      spec {
        container {
          image = var.application_container_image
          name  = var.application_container_name

          port {
            container_port = var.application_container_port
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "125Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "application" {
  depends_on = [helm_release.postgresql]

  metadata {
    name = var.application_container_name
  }
  spec {
    selector = {
      App = kubernetes_deployment.application.spec.0.template.0.metadata[0].labels.App
    }
    port {
      node_port   = 30201
      port        = var.application_container_port
      target_port = var.application_container_port
    }

    type = "NodePort"
  }
}
