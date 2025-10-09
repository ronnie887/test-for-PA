module "postgresql_server" {
  source  = "Azure/avm-res-dbforpostgresql-flexibleserver/azurerm"
  version = "~> 0.1.4"

  name                = var.name#"psql-${var.project_name}-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location

  #zone                = null
  #high_availability   = null
  high_availability = { mode = "SameZone" }


  administrator_login    = var.admin_username
  administrator_password = var.admin_password

  sku_name   = var.environment == "prod" ? "GP_Standard_D4s_v3" : "GP_Standard_D2s_v3"
  storage_mb = var.environment == "prod" ? 131072 : 32768
  server_version    = "16"

  backup_retention_days        = var.environment == "prod" ? 35 : 7
  geo_redundant_backup_enabled = var.environment == "prod" ? true : false

  tags = var.tags
}
