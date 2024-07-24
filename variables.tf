variable "rgname" {
  type        = string
  description = "resource group name"

}

variable "location" {
  description = "The location of the resources."
  type        = string
}

variable "service_principal_name" {
  type = string
}

variable "keyvault_name" {
  type = string
}

variable "scope_id" {
  type = string
}
variable "subscription_id" {
  type = string
}
variable "scope" {
  type = string
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace."
  type        = string
}
