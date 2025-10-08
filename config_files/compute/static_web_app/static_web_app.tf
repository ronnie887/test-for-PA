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
    key                  = "config_files/compute/static_web_app/terraform.tfstate"
  }
}

# Web Services (AVM) - Static Web App
module "static_web_app" {
  source = "../../../modules/compute/static_web_app"
  
  project_name                        = var.project_name
  environment                         = var.environment
  location                            = var.location
  resource_group_name                 = data.terraform_remote_state.resource_group.outputs.resource_group_name
  managed_identity_resource_id        = data.terraform_remote_state.uami.outputs.managed_identity["resource_id"]
  tags                                = local.common_tags
}