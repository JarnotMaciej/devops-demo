output "aks_resource_group" {
  value = azurerm_resource_group.aks_cluster.resource_group_name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}