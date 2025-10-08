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
    resource_group_name  = "pa-tfstate-rg"
    storage_account_name = "patfstatestorage"
    container_name       = "tfstate"
    key                  = "config_files/compute/app_service_plan/terraform.tfstate"
  }
}

# Web Services (AVM) - App Plan
module "app_service_plan" {
  source = "../../../modules/compute/app_service_plan"
  
  project_name                        = var.project_name
  environment                         = var.environment
  location                            = var.location
  resource_group_name                 = data.terraform_remote_state.resource_group.outputs.resource_group_name
  app_service_plan_sku_name           = var.app_service_plan_sku_name
  tags                                = local.common_tags
}
