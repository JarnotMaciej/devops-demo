output "aks_resource_group" {
  value = azurerm_resource_group.devops_demo.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}