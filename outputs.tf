output "resource_group_name" {
    description = "Name of the resource group"
    value = azurerm_resource_group.main.name
}

output "storage_account_name" {
    description = "Name of the Storage Account (ADLS Gen2)"
    value = azurerm_storage_account.datalake.name
}

output "postgres_server_name" {
    description = "PostgreSQL Flexible Server name"
    value = azurerm_postgresql_flexible_server.main.name
}

output "synapse_workspace_name" {
    description = "Synapse Workspace name"
    value = azurerm_synapse_workspace.main.name
}

output "webapp_url" {
    description = "Default URL of the Web App"
    value = azurerm_windows_web_app.portal.default_hostname
}
