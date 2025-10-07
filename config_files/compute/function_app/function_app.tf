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

# Web Services (AVM) - Function App
module "function_app" {
  source = "../../../modules/compute/function_app"
  
  project_name                        = var.project_name
  environment                         = var.environment
  location                            = var.location
  resource_group_name                 = data.terraform_remote_state.resource_group.outputs.resource_group_name
  managed_identity_resource_id        = data.terraform_remote_state.uami.outputs.managed_identity["resource_id"]
  storage_account_name                = data.terraform_remote_state.storage_account.outputs.storage["storage_account_name"]
  service_plan_id                     = data.terraform_remote_state.app_service_plan.outputs.web_services["app_service_plan_id"]
  tags                                = local.common_tags
}