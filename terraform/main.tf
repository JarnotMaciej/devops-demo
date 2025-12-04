terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "tfbackenddevopsdemo"
    container_name = "terraform"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription
}

resource "azurerm_resource_group" "devops_demo" {
  name     = var.resource-group["name"]
  location = var.resource-group["location"]

  tags = {
    Environment = "Development"
  }
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster["name"]
  location            = azurerm_resource_group.devops_demo.location
  resource_group_name = azurerm_resource_group.devops_demo.name
  dns_prefix          = var.aks_cluster["dns_prefix"]

  default_node_pool {
    name       = "default"
    node_count = var.aks_cluster["node_count"]
    vm_size    = var.aks_cluster["vm_size"]
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
  }
}

output "kubernetes_config" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true
}

output "kubernetes_admin_config" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_admin_config_raw
  sensitive = true
}