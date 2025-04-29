resource "helm_release" "postgresql" {
  depends_on = [module.eks.eks_managed_node_groups]

  name       = var.postgresql_container_name
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "postgresql"

  set = [
    {
      name  = "primary.persistence.enabled"
      value = false
    },
    {
      name  = "auth.usePasswordFiles"
      value = false
    },
    {
      name  = "auth.enablePostgresUser"
      value = true
    },
    {
      name  = "auth.postgresPassword"
      value = var.postgresql_password
    },
    {
      name  = "auth.username"
      value = var.postgresql_user
    },
    {
      name  = "auth.password"
      value = var.postgresql_password
    },
    {
      name  = "auth.database"
      value = var.postgresql_database
    },
    {
      name  = "passwordUpdateJob.enabled"
      value = true
    }
  ]
}