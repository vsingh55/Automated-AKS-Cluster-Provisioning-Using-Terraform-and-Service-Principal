variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}

variable "service_principal_name" {
  type = string
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub" // Ensure this file exists or update with your SSH public key path
}

variable "client_id" {}

variable "client_secret" {
  type      = string
  sensitive = true
}