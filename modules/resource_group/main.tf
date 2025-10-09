module "resource_group" {
  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "~> 0.2"

  name     = var.name#"rg-${var.project_name}-${var.environment}"
  location = var.location
  tags     = var.tags
}