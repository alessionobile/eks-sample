output "region" {
  value = var.region
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_arn" {
  value = module.eks.cluster_arn
}

output "api_url" {
  value = "http://${data.kubernetes_service.nginx.status.0.load_balancer.0.ingress.0.hostname}"
}

output "kubectl_auto_config" {
  value = "aws eks update-kubeconfig --region ${var.region} --name ${module.eks.cluster_name}"
}