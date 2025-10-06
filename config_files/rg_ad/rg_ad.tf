# Resource Group (AVM)
module "resource_group" {
  source = "../../modules/resource_group"
  
  project_name = var.project_name
  environment  = var.environment
  location     = var.location
  tags         = local.common_tags
}

# Azure AD Application and Service Principal (CUSTOM - No AVM)
module "azure_ad_sp" {
  source = "../../modules/azure_ad_sp"
  
  project_name      = var.project_name
  environment       = var.environment
  azure_ad_app_name = var.azure_ad_app_name
}