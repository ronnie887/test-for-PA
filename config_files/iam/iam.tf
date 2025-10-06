# User Managed Identity (AVM)
module "managed_identity" {
  source = "../../modules/iam/user_assigned_managed_identity"
  
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = data.terraform_remote_state.rg_ad.outputs.resource_group_name
  tags                = local.common_tags
}

# Key Vault (AVM)
module "key_vault" {
  source = "../../modules/iam/key_vault"
  
  project_name                  = var.project_name
  environment                   = var.environment
  location                      = var.location
  resource_group_name           = data.terraform_remote_state.rg_ad.outputs.resource_group_name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  managed_identity_principal_id = module.managed_identity.principal_id
  service_principal_object_id   = data.terraform_remote_state.rg_ad.outputs.service_principal_object_id

  #secrets_value = {
  #  sp_client_id    = data.terraform_remote_state.rg_ad.outputs.application_client_id
  #  sp_client_secret = data.terraform_remote_state.rg_ad.outputs.service_principal_password
  #}
  
  tags                          = local.common_tags
}

