output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.network.name
}

output "resource_group_location" {
  description = "Location of the resource group"
  value       = azurerm_resource_group.network.location
}

output "service_principal_application_id" {
  description = "Application ID of the Service Principal"
  value       = azurerm_azuread_application.sp_app.application_id
}

output "service_principal_id" {
  description = "ID of the Service Principal"
  value       = azurerm_azuread_service_principal.sp.id
}

output "role_assignment_id" {
  description = "ID of the Role Assignment"
  value       = azurerm_role_assignment.sp_role.id
}

output "role_assignment_scope" {
  description = "Scope of the Role Assignment"
  value       = azurerm_role_assignment.sp_role.scope
}

output "role_assignment_principal_id" {
  description = "Principal ID of the Role Assignment"
  value       = azurerm_role_assignment.sp_role.principal_id
}

output "role_assignment_role_definition_name" {
  description = "Role definition name of the Role Assignment"
  value       = azurerm_role_assignment.sp_role.role_definition_name
}