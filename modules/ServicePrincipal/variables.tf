variable "service_principal_name" {
  type = string
}

variable "password_length" {
  description = "The length of the randomly generated password for the Service Principal."
  type        = number
  default     = 16
}

variable "password_special" {
  description = "Whether the randomly generated password should include special characters."
  type        = bool
  default     = true
}