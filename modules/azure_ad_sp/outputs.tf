output "application_client_id" {
  description = "Application ID of the Azure AD app"
  value       = azuread_application.main.client_id
}

output "service_principal_object_id" {
  description = "Object ID of the service principal"
  value       = azuread_service_principal.main.object_id
}

output "service_principal_password" {
  description = "Password of the service principal"
  value       = azuread_service_principal_password.main.value
  sensitive   = true
}
