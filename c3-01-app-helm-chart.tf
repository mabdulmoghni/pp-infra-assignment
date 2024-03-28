################################################################################
# Install app-helm-chart With Helm
################################################################################

resource "helm_release" "pp-client-demo" {
  name      = "pp-assignment"
  chart     = "./helm/pp-client-demo"
  namespace = "default"
  depends_on = [
    module.eks.eks_managed_node_groups
  ]

  set {
    name  = "db_password"
    value = var.dbPass
  }
}
