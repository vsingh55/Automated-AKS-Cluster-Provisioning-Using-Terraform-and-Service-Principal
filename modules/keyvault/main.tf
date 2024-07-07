data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                        = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = false
  sku_name                    = "premium"
  soft_delete_retention_days  = 7
  enable_rbac_authorization   = true //alternate of secret policy
}


# # Store the Service Principal client ID in Key Vault
# resource "azurerm_key_vault_secret" "client_id" {
#   name         = "service-principal-client-id"
#   value        = var.client_id
#   key_vault_id = azurerm_key_vault.kv.id
# }

# # Store the Service Principal client secret in Key Vault
# resource "azurerm_key_vault_secret" "client_secret" {
#   name         = "service-principal-client-secret"
#   value        = var.client_secret
#   key_vault_id = azurerm_key_vault.kv.id
# }