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
    key                  = "test/iam/uami/terraform.tfstate"
  }
}

## User Managed Identity (AVM)
module "managed_identity" {
  source = "../../../modules/iam/user_assigned_managed_identity"
  
  name                = "uami-pa-integrix-test1"
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = data.terraform_remote_state.resource_group.outputs.resource_group_name
  tags                = var.tags
}
