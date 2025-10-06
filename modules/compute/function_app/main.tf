# Function App
module "function_app" {
  source  = "Azure/avm-res-web-site/azurerm"
  version = "~> 0.19"

  name                     = "func-${var.project_name}-${var.environment}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  service_plan_resource_id = var.service_plan_id
  kind                     = "functionapp"
  os_type                  = "Linux"

  managed_identities = {
    user_assigned_resource_ids = [var.managed_identity_resource_id]
  }

  storage_account_name                  = var.storage_account_name   # e.g., "stadlspaprojectdev4791"
  storage_user_assigned_identity_id     = var.managed_identity_resource_id

  app_settings = {
    "AzureWebJobsStorage__accountName" = var.storage_account_name
    # Add any other app settings here
  }

  tags = var.tags
}
