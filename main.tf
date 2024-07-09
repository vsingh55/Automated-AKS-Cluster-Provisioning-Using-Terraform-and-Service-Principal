provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.location
}

module "ServicePrincipal" {
  source                 = "./modules/ServicePrincipal"
  service_principal_name = var.service_principal_name

  depends_on = [
    azurerm_resource_group.rg
  ]
}


resource "azurerm_role_assignment" "rolespn" {

  scope                = "/subscriptions/${var.subscription_id}" 
  role_definition_name = "Contributor"
  principal_id         = module.ServicePrincipal.service_principal_object_id
  description          = "Role Based Access Control, Contributor role assignment to ServicePrincipal"

  depends_on = [
    module.ServicePrincipal
  ]
}

module "keyvault" {
  source                      = "./modules/keyvault"
  keyvault_name               = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.rgname
  service_principal_name      = var.service_principal_name
  service_principal_object_id = module.ServicePrincipal.service_principal_object_id
  service_principal_tenant_id = module.ServicePrincipal.service_principal_tenant_id

  client_id    = module.ServicePrincipal.client_id
  client_secret = module.ServicePrincipal.client_secret

  depends_on = [
    module.ServicePrincipal
  ]
}

# Store client_id and Client_secret in Key_vault
resource "azurerm_key_vault_secret" "spn_secret" {
  name         = module.ServicePrincipal.client_id
  value        = module.ServicePrincipal.client_secret
  key_vault_id = module.keyvault.keyvault_id

  depends_on = [
    module.keyvault, 
  ]
}



#create Azure Kubernetes Service
module "aks" {
  source                 = "./modules/aks/"
  service_principal_name = var.service_principal_name
  client_id              = module.ServicePrincipal.client_id
  client_secret          = module.ServicePrincipal.client_secret
  location               = var.location
  resource_group_name    = var.rgname

  depends_on = [
    module.ServicePrincipal
  ]

}

resource "local_file" "kubeconfig" {
  depends_on = [module.aks]
  filename   = "./kubeconfig"
  content    = module.aks.config
}
