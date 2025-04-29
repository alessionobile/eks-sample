resource "helm_release" "nginx" {
  depends_on = [kubernetes_deployment.application, kubernetes_service.application]

  name       = var.nginx_container_name
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "nginx"

  set = [
    {
      name  = "tls.enabled"
      value = false
    },
    {
      name  = "containerPorts.http"
      value = var.nginx_container_port
    },
    {
      name  = "service.targetPort.https"
      value = "http"
    },
    {
      name  = "replicaCount"
      value = 1
    },
  ]

  values = [
    templatefile("${path.module}/templates/nginx-values.tftpl", {
      nginx_port       = var.nginx_container_port,
      application_host = var.application_container_name,
      application_port = var.application_container_port
    })
  ]
}

data "kubernetes_service" "nginx" {
  depends_on = [helm_release.nginx]

  metadata {
    name = "nginx"
  }
}