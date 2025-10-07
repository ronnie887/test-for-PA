## Resource Group (AVM)
module "resource_group" {
  source = "../../modules/resource_group"
  
  project_name = var.project_name
  environment  = var.environment
  location     = var.location
  tags         = local.common_tags
}

