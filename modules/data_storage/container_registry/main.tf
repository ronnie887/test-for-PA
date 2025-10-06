resource "random_integer" "acr_suffix" {
  min = 1000
  max = 9999
}

module "container_registry" {
  source  = "Azure/avm-res-containerregistry-registry/azurerm"
  version = "~> 0.5"

  name                = "cr${replace(var.project_name, "-", "")}${var.environment}${random_integer.acr_suffix.result}"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku                 = var.environment == "prod" ? "Premium" : "Basic"
  admin_enabled       = false
  zone_redundancy_enabled = false
  
  
  role_assignments = {
    managed_identity_pull = {
      role_definition_id_or_name = "AcrPull"
      principal_id               = var.managed_identity_principal_id
    }
    managed_identity_push = {
      role_definition_id_or_name = "AcrPush"
      principal_id               = var.managed_identity_principal_id
    }
  }

  tags = var.tags
}
