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
    storage_account_name = "stintegrixtfstateprod" #check
    container_name       = "tfstate"
    key                  = "prod/iam/rbac/terraform.tfstate"
  }
}

# RBAC (AVM) - Role Assignments
module "rbac" {
  source = "../../../modules/iam/rbac"
  
  resource_group_id               = data.terraform_remote_state.resource_group.outputs.resource_group_id
  managed_identity_principal_id   = data.terraform_remote_state.uami.outputs.managed_identity["principal_id"]
  service_principal_object_id     = data.terraform_remote_state.azure_ad_sp.outputs.service_principal_object_id
  storage_account_id              = data.terraform_remote_state.storage_account.outputs.storage["storage_account_id"]
}