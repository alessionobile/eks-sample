locals {
  tags = {
    created-by = var.cluster_name
    env        = var.cluster_name
  }
}