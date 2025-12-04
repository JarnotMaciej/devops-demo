variable "resource-group" {
    type = object({
        name = string
        location = string
    })
    default = {
        name = "my-resource-group"
        location = "Poland Central"
    }
}

variable "subscription" {
    type = string
    description = "The subscription ID to deploy resources into"
}

variable "aks_cluster" {
    type = object({
        name       = string
        dns_prefix = string
        node_count = number
        vm_size    = string
    })
    default = {
        name       = "devops-demo-aks"
        dns_prefix = "devopsdemoaks"
        node_count = 2
        vm_size    = "Standard_B2s"
    }
}
