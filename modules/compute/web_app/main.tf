# Web App
module "web_app" {
  source  = "Azure/avm-res-web-site/azurerm"
  version = "~> 0.19"

  name                = "app-${var.project_name}-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location

  service_plan_resource_id = var.service_plan_id
  kind                     = "webapp"
  os_type                  = "Linux"

  managed_identities = {
    user_assigned_resource_ids = [var.managed_identity_resource_id]
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    #"DOCKER_REGISTRY_SERVER_URL"          = "https://${var.container_registry_login_server}"
    #"DOCKER_REGISTRY_SERVER_USERNAME"     = var.container_registry_admin_username
  }

  tags = var.tags
}