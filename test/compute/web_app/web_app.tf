provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  subscription_id = "adde48e9-ba85-4182-af13-13f9385a101c"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "pa-tfstate-rg-01"
    storage_account_name = "patfstatestorage02"
    container_name       = "tfstate"
    key                  = "test/compute/web_app/terraform.tfstate"
  }
}

# Web Services (AVM) - Web App
module "web_app" {
  source = "../../../modules/compute/web_app"
  
  name                                = "wa1-pa-integrix-test1"
  project_name                        = var.project_name
  environment                         = var.environment
  location                            = var.location
  resource_group_name                 = data.terraform_remote_state.resource_group.outputs.resource_group_name
  managed_identity_resource_id        = data.terraform_remote_state.uami.outputs.managed_identity["resource_id"]
  container_registry_login_server     = data.terraform_remote_state.container_registry.outputs.container_registry["login_server"]
  service_plan_id                     = data.terraform_remote_state.app_service_plan.outputs.web_services["app_service_plan_id"]
  app_service_plan_sku_name           = var.app_service_plan_sku_name
  tags                                = var.tags
}
