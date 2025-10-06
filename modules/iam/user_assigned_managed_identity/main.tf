module "managed_identity" {
  source  = "Azure/avm-res-managedidentity-userassignedidentity/azurerm"
  version = "~> 0.3"

  name                = "mi-${var.project_name}-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}