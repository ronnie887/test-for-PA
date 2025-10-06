# Static Web App
module "static_web_app" {
  source  = "Azure/avm-res-web-staticsite/azurerm"
  version = "~> 0.6"

  name                = "swa-${var.project_name}-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku_tier = var.environment == "prod" ? "Standard" : "Free"
  sku_size = var.environment == "prod" ? "Standard" : "Free"

  tags = var.tags
}