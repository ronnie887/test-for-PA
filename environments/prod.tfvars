project_name               = "paproject"
environment                = "prod"

tags = {
  Owner       = "ProdTeam"
  Environment = "Production"
  CostCenter  = "Engineering"
  Project     = "PA-Analytics"
  Backup      = "Required"
}

# Database Configuration
postgresql_admin_password  = "SuperSecureProdPassword123!"

# App Service Plan Configuration
app_service_plan_sku_name  = "P1v2"

# Redis Configuration
redis_capacity             = 2
redis_family               = "C"
redis_sku_name             = "Premium"

# Azure AD
azure_ad_app_name          = "PAProject-Prod-ServicePrincipal"

# Synapse Configuration
synapse_sql_admin_password = "SuperSecureSynapsePassword123!"
