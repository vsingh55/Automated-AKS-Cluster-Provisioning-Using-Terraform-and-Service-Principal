terraform {
  backend "azurerm" {
    resource_group_name  = "backend-rg"
    storage_account_name = var.storage_account_name
    container_name       = "tfstate"
    key                  = "AksTF.terraform.tfstate"
  }
}

