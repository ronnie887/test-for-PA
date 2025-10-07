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

# Redis Cache (AVM)
module "redis_cache" {
  source = "../../../modules/data_storage/redis_cache"
  
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = data.terraform_remote_state.resource_group.outputs.resource_group_name
  redis_capacity      = var.redis_capacity
  #redis_family        = var.redis_family
  redis_sku_name      = var.redis_sku_name
  tags                = local.common_tags
}