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
    resource_group_name  = "rg-integrix-tfstate" #check
    storage_account_name = "stintegrixtfstatedev" #check
    container_name       = "tfstate"
    key                  = "dev/data_storage/container_registry/terraform.tfstate"
  }
}

# Container Registry (AVM)
module "container_registry" {
  source = "../../../modules/data_storage/container_registry"
  
  name                             = "acrpaintegrixdev"
  project_name                     = var.project_name
  environment                      = var.environment
  location                         = var.location
  resource_group_name              = data.terraform_remote_state.resource_group.outputs.resource_group_name
  managed_identity_principal_id    = data.terraform_remote_state.uami.outputs.managed_identity["principal_id"]
  tags                             = var.tags
}