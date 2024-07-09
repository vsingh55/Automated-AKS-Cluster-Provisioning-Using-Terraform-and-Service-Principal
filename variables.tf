variable "rgname" {
  type        = string
  description = "resource group name"

}

variable "location" {
  type    = string
  default = "canadacentral"
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

variable "storage_account_name" {
  description = "The name of storage account created for backend"
  type = string
}