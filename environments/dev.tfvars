project_name  = "pa-integrix"
environment   = "dev"
location      = "centralus"          

tags = {
  Owner       = "DevTeam"
  Environment = "Development"
  CostCenter  = "Engineering"
  Project     = "PA-integriX"
}

# Database Configuration
postgresql_admin_password  = "DevPassword123!"

# App Service Plan Configuration
app_service_plan_sku_name  = "B1"
zone_balancing_enabled = false
zone_redundancy_enabled = false

# Redis Configuration
redis_capacity             = 0
#family               = "C"
redis_sku_name             = "Basic"

# Azure AD
azure_ad_app_name          = "PA-IntegriX-Dev"

# Synapse Configuration
synapse_sql_admin_password = "DevSynapsePassword123!"

