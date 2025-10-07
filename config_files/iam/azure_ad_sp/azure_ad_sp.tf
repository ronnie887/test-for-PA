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

provider "azuread" {}

# Azure AD Application and Service Principal (CUSTOM - No AVM)
module "azure_ad_sp" {
  source = "../../../modules/iam/azure_ad_sp"
  
  project_name      = var.project_name
  environment       = var.environment
  azure_ad_app_name = var.azure_ad_app_name
}