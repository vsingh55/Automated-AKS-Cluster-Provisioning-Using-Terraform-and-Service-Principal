terraform {
  backend "azurerm" {
    resource_group_name  = "backend-rg"
    storage_account_name = "value"  //Put the name of provisioned storage account name for backend 
    container_name       = "tfstate"
    key                  = "AksTF.terraform.tfstate"
  }
}

