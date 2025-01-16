resource "azurerm_resource_group" "network" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_azuread_application" "sp_app" {
  name                       = var.sp_name
  available_to_other_tenants = false
}

resource "azurerm_azuread_service_principal" "sp" {
  application_id = azurerm_azuread_application.sp_app.application_id
}

resource "azurerm_role_assignment" "sp_role" {
  principal_id   = azurerm_azuread_service_principal.sp.id
  role_definition_name = "Contributor"
  scope           = azurerm_resource_group.network.id
}
