# Data Factory (AVM)
module "data_factory" {
  source = "../../modules/integration/data_factory"
  
  project_name                 = var.project_name
  environment                  = var.environment
  location                     = var.location
  resource_group_name          = data.terraform_remote_state.rg_ad.outputs.resource_group_name
  managed_identity_resource_id = data.terraform_remote_state.iam.outputs.managed_identity["resource_id"]
  tags                         = local.common_tags
}

# Storage Accounts (AVM) - ADLS Gen2
module "storage_account" {
  source = "../../modules/data_storage/storage_account"
  
  project_name                     = var.project_name
  environment                      = var.environment
  location                         = var.location
  resource_group_name              = data.terraform_remote_state.rg_ad.outputs.resource_group_name
  managed_identity_principal_id    = data.terraform_remote_state.iam.outputs.managed_identity["principal_id"]
  tags                             = local.common_tags
}