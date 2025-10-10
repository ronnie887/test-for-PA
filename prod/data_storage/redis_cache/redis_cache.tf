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
    key                  = "prod/data_storage/redis_cache/terraform.tfstate"
  }
}

# Redis Cache (AVM)
module "redis_cache" {
  source = "../../../modules/data_storage/redis_cache"
  
  name                = "redis-pa-integrix-prod" #check
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = data.terraform_remote_state.resource_group.outputs.resource_group_name
  redis_capacity      = var.redis_capacity
  redis_sku_name      = var.redis_sku_name
  tags                = var.tags
}