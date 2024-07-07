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

  scope                = "/subscriptions/e9ff9017-58da-4178-b91a-d1291ce1e572" //replace subscription id ${var.subscription_id}
  role_definition_name = "Contributor"
  principal_id         = module.ServicePrincipal.service_principal_application_id
  description          = "Role Based Access Control Administrator role assignment with owener permission"

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

# resource "azurerm_role_assignment" "keyvault_secret_officer" {
#   principal_id          = data.azuread_service_principal.main.object_id
#   role_definition_name  = "Key Vault Secrets Officer"
#   scope                 = azurerm_key_vault.kv.id
# }


# resource "azurerm_role_assignment" "role-secret-officer" {
#   role_definition_name = "Key Vault Secrets Officer"
#   principal_id         = module.ServicePrincipal.service_principal_object_id
#   scope                = module.keyvault.keyvault_id

#   # depends_on = [module.keyvault, module.ServicePrincipal]
# }


# # resource "azurerm_key_vault_secret" "database-password" {
# #   name         = var.secret_name
# #   value        = var.secret_value
# #   key_vault_id = azurerm_key_vault.keyvault.id

# #   depends_on = [azurerm_role_assignment.role-secret-officer]
# # }

# resource "azurerm_key_vault_secret" "spn_secret" {
#   name         = module.ServicePrincipal.client_id
#   value        = module.ServicePrincipal.client_secret
#   key_vault_id = module.keyvault.keyvault_id

#   depends_on = [
#     module.keyvault
#   ]
# }
# resource "azurerm_role_assignment" "role-secret-user" {
#   role_definition_name = "Key Vault Secrets User"
#   principal_id         = module.ServicePrincipal.service_principal_object_id
#   scope                = "${module.keyvault.keyvault_id}/secrets/${azurerm_key_vault_secret.spn_secret.name}"
#   // scope                = "/subscriptions/xxxxxxxxx/resourceGroups/kv_rbac_terraform_rg/providers
#   //                         /Microsoft.KeyVault/vaults/demokv01093/secrets/MySecret"
#   // scope                = azurerm_key_vault_secret.database-password.id
# }

# # resource "azurerm_role_assignment" "key_vault_administrator" {
# #   role_definition_name = "Key Vault Administrator"
# #   principal_id         = module.ServicePrincipal.service_principal_object_id
# #   scope                = module.keyvault.keyvault_id

# #   # "/subscriptions/e9ff9017-58da-4178-b91a-d1291ce1e572/resourceGroups/AKS-KV-Using-TF-SP/providers/Microsoft.KeyVault/vaults/kv-vsingh55"

# #   depends_on = [
# #     module.keyvault
# #   ]
# # }



# #create Azure Kubernetes Service
# module "aks" {
#   source                 = "./modules/aks/"
#   service_principal_name = var.service_principal_name
#   client_id              = module.ServicePrincipal.client_id
#   client_secret          = module.ServicePrincipal.client_secret
#   location               = var.location
#   resource_group_name    = var.rgname

#   depends_on = [
#     module.ServicePrincipal
#   ]

# }

# resource "local_file" "kubeconfig" {
#   depends_on = [module.aks]
#   filename   = "./kubeconfig"
#   content    = module.aks.config
# }
