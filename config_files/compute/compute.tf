# Web Services (AVM) - App Plan
module "app_service_plan" {
  source = "../../modules/compute/app_service_plan"
  
  project_name                        = var.project_name
  environment                         = var.environment
  location                            = var.location
  resource_group_name                 = data.terraform_remote_state.rg_ad.outputs.resource_group_name
  app_service_plan_sku_name           = var.app_service_plan_sku_name
  tags                                = local.common_tags
}

# Web Services (AVM) - Web App
module "web_app" {
  source = "../../modules/compute/web_app"
  
  project_name                        = var.project_name
  environment                         = var.environment
  location                            = var.location
  resource_group_name                 = data.terraform_remote_state.rg_ad.outputs.resource_group_name
  managed_identity_resource_id        = data.terraform_remote_state.iam.outputs.managed_identity["resource_id"]
  container_registry_login_server     = data.terraform_remote_state.rest_storage.outputs.container_registry["login_server"]
  service_plan_id                     = module.app_service_plan.resource_id
  app_service_plan_sku_name           = var.app_service_plan_sku_name
  tags                                = local.common_tags
}

# Web Services (AVM) - Function App
module "function_app" {
  source = "../../modules/compute/function_app"
  
  project_name                        = var.project_name
  environment                         = var.environment
  location                            = var.location
  resource_group_name                 = data.terraform_remote_state.rg_ad.outputs.resource_group_name
  managed_identity_resource_id        = data.terraform_remote_state.iam.outputs.managed_identity["resource_id"]
  storage_account_name                = data.terraform_remote_state.df_sa.outputs.storage["storage_account_name"]
  service_plan_id                     = module.app_service_plan.resource_id
  tags                                = local.common_tags
}

# Web Services (AVM) - Static Web App
module "static_web_app" {
  source = "../../modules/compute/static_web_app"
  
  project_name                        = var.project_name
  environment                         = var.environment
  location                            = var.location
  resource_group_name                 = data.terraform_remote_state.rg_ad.outputs.resource_group_name
  managed_identity_resource_id        = data.terraform_remote_state.iam.outputs.managed_identity["resource_id"]
  tags                                = local.common_tags
}