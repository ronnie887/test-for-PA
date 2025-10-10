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
    container_name       = "tfstate" #check
    key                  = "prod/resource_group/terraform.tfstate"
  }
}

## Resource Group (AVM)
module "resource_group" {
  source = "../../../modules/resource_group"
  
  name         = "rg-pa-integrix-prod" #check
  location     = var.location
  project_name = var.project_name
  environment  = var.environment
  tags         = var.tags
}