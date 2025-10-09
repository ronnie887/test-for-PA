# App Service Plan
module "app_service_plan" {
  source  = "Azure/avm-res-web-serverfarm/azurerm"
  version = "~> 0.7"

  name                = var.name#"asp-${var.project_name}-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location

  os_type  = "Linux"
  sku_name = var.app_service_plan_sku_name
  zone_balancing_enabled = false
  tags = var.tags
}