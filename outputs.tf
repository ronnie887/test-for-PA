output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.rg.name
}

output "adls_storage_account_name" {
  description = "ADLS Gen2 storage account name"
  value       = azurerm_storage_account.adls.name
}

output "adls_storage_account_primary_endpoint" {
  description = "Primary DFS endpoint of the ADLS Gen2 account"
  value       = azurerm_storage_account.adls.primary_dfs_endpoint
}

output "key_vault_name" {
  description = "Name of the Azure Key Vault"
  value       = azurerm_key_vault.kv.name
}

output "key_vault_uri" {
  description = "URI of the Azure Key Vault"
  value       = azurerm_key_vault.kv.vault_uri
}

output "postgres_server_fqdn" {
  description = "Fully qualified domain name of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.postgres.fqdn
}

output "postgres_database_name" {
  description = "Name of the PostgreSQL database"
  value       = azurerm_postgresql_flexible_server_database.app_db.name
}

output "container_registry_login_server" {
  description = "Login server of the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

output "container_registry_admin_username" {
  description = "Admin username for the Azure Container Registry"
  value       = azurerm_container_registry.acr.admin_username
  sensitive   = true
}

output "web_app_url" {
  description = "URL of the deployed Linux Web App"
  value       = "https://${azurerm_linux_web_app.web_app.default_hostname}"
}

output "web_app_name" {
  description = "Name of the Linux Web App"
  value       = azurerm_linux_web_app.web_app.name
}

output "data_factory_name" {
  description = "Name of the Azure Data Factory"
  value       = azurerm_data_factory.adf.name
}

output "data_factory_identity_principal_id" {
  description = "Principal ID of the Data Factory managed identity"
  value       = azurerm_data_factory.adf.identity[0].principal_id
}

output "app_service_plan_name" {
  description = "Name of the App Service Plan"
  value       = azurerm_service_plan.app_plan.name
}

output "azure_ad_application_id" {
  description = "Application (client) ID of the Azure AD application"
  value       = azuread_application.app.application_id
}

output "user_assigned_identity_id" {
  description = "ID of the User-Assigned Managed Identity"
  value       = azurerm_user_assigned_identity.uami_core.id
}

output "user_assigned_identity_principal_id" {
  description = "Principal ID of the User-Assigned Managed Identity"
  value       = azurerm_user_assigned_identity.uami_core.principal_id
}