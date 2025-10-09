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
    key                  = "config_files/iam/key_vault/terraform.tfstate"
  }
}

# Key Vault (AVM)
module "key_vault" {
  source = "../../../modules/iam/key_vault"
  
  name                          = "kv-pa-integrix-test1"
  project_name                  = var.project_name
  environment                   = var.environment
  location                      = var.location
  resource_group_name           = data.terraform_remote_state.resource_group.outputs.resource_group_name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  managed_identity_principal_id = data.terraform_remote_state.uami.outputs.managed_identity["principal_id"]
  service_principal_object_id   = data.terraform_remote_state.azure_ad_sp.outputs.service_principal_object_id
  tags                          = var.tags
}