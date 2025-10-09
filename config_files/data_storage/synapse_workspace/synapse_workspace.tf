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
    key                  = "config_files/data_storage/synapse_workspace/terraform.tfstate"
  }
}

# Synapse Workspace (CUSTOM - Proposed but not published yet)
module "synapse_workspace" {
  source = "../../../modules/data_storage/synapse_workspace"
  
  name                         = "syn-pa-integrix-test1" 
  project_name                 = var.project_name
  environment                  = var.environment
  location                     = var.location
  resource_group_name          = data.terraform_remote_state.resource_group.outputs.resource_group_name
  filesystem_id                = "https://${data.terraform_remote_state.storage_account.outputs.storage["storage_account_name"]}.dfs.core.windows.net/raw"
  sql_admin_username           = var.synapse_sql_admin_username
  sql_admin_password           = var.synapse_sql_admin_password
  managed_identity_resource_id = data.terraform_remote_state.uami.outputs.managed_identity["resource_id"]
  tags                         = var.tags
}
