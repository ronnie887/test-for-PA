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

# User Managed Identity (AVM)
module "managed_identity" {
  source = "../../../modules/iam/user_assigned_managed_identity"
  
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = data.terraform_remote_state.resource_group.outputs.resource_group_name
  tags                = local.common_tags
}
