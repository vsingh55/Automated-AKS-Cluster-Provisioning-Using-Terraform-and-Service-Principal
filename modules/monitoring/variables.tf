variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace."
  type        = string
}

variable "location" {
  description = "The location of the resources."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "aks_cluster_id" {
  description = "The resource ID of the AKS cluster."
  type        = string
}
