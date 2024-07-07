# Fetch current client config
data "azuread_client_config" "current" {}

# Create Azure AD Application
resource "azuread_application" "main" {
  display_name = var.service_principal_name
  owners       = [data.azuread_client_config.current.object_id]
}

# Create Azure AD Service Principal
resource "azuread_service_principal" "main" {
  client_id = azuread_application.main.client_id
  app_role_assignment_required = true
  owners                       = [data.azuread_client_config.current.object_id]
}

# Create Service Principal Password
resource "azuread_service_principal_password" "main" {
  service_principal_id = azuread_service_principal.main.object_id
}
