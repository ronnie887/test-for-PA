# Use native Terraform resources since no AVM module is published yet
resource "azurerm_synapse_workspace" "main" {
  name                = "synapse-${var.project_name}-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location

  storage_data_lake_gen2_filesystem_id = var.filesystem_id

  sql_administrator_login          = var.sql_admin_username
  sql_administrator_login_password = var.sql_admin_password

  # Managed identity configuration  
  identity {
    type         = "SystemAssigned, UserAssigned"
    identity_ids = [var.managed_identity_resource_id]
  }

  # Environment-specific configurations
  sql_identity_control_enabled = var.environment == "prod" ? true : false

  tags = var.tags
}
