# Database (AVM) - PostgreSQL Flexible Server
module "postgresql_server" {
  source = "../../modules/data_storage/postgres_flexible_server"
  
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = data.terraform_remote_state.rg_ad.outputs.resource_group_name
  admin_username      = var.postgresql_admin_username
  admin_password      = var.postgresql_admin_password
  #version             = "16"
  tags                = local.common_tags
}

# Container Registry (AVM)
module "container_registry" {
  source = "../../modules/data_storage/container_registry"
  
  project_name                     = var.project_name
  environment                      = var.environment
  location                         = var.location
  resource_group_name              = data.terraform_remote_state.rg_ad.outputs.resource_group_name
  managed_identity_principal_id    = data.terraform_remote_state.iam.outputs.managed_identity["principal_id"]
  tags                             = local.common_tags
}

# Redis Cache (AVM)
module "redis_cache" {
  source = "../../modules/data_storage/redis_cache"
  
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = data.terraform_remote_state.rg_ad.outputs.resource_group_name
  redis_capacity      = var.redis_capacity
  #redis_family        = var.redis_family
  redis_sku_name      = var.redis_sku_name
  tags                = local.common_tags
}

# Synapse Workspace (CUSTOM - Proposed but not published yet)
module "synapse_workspace" {
  source = "../../modules/data_storage/synapse_workspace"
  
  project_name                 = var.project_name
  environment                  = var.environment
  location                     = var.location
  resource_group_name          = data.terraform_remote_state.rg_ad.outputs.resource_group_name
  filesystem_id                = "https://${data.terraform_remote_state.df_sa.outputs.storage["storage_account_name"]}.dfs.core.windows.net/raw"
  sql_admin_username           = var.synapse_sql_admin_username
  sql_admin_password           = var.synapse_sql_admin_password
  managed_identity_resource_id = data.terraform_remote_state.iam.outputs.managed_identity["resource_id"]
  tags                         = local.common_tags
}

# RBAC (AVM) - Role Assignments
module "rbac" {
  source = "../../modules/iam/rbac"
  
  resource_group_id               = data.terraform_remote_state.rg_ad.outputs.resource_group_id
  managed_identity_principal_id   = data.terraform_remote_state.iam.outputs.managed_identity["principal_id"]
  service_principal_object_id     = data.terraform_remote_state.rg_ad.outputs.service_principal_object_id
  storage_account_id              = data.terraform_remote_state.df_sa.outputs.storage["storage_account_id"]
}