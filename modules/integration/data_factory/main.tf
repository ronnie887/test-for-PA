module "data_factory" {
  source  = "Azure/avm-res-datafactory-factory/azurerm"
  version = "~> 0.1.0"

  name                = "df-${var.project_name}-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location

  managed_identities = {
    user_assigned_resource_ids = [var.managed_identity_resource_id]
  }

  tags = var.tags
}
