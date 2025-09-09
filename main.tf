terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

## Resource Group
resource "azurerm_resource_group" "main" {
  name = var.resource_group_name
  location = var.location
}

## Storage Account (ADLS Gen2)
resource "azurerm_storage_account" "datalake" {
  name = "azurepasa"
  resource_group_name = azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  enable_https_traffic_only = true
  is_hns_enabled = true # Required for ADLS Gen2
}

## Key Vault
resource "azurerm_key_vault" "main" {
  name = "pa-azure-kv"
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name = "standard"
  soft_delete_retention_days = 7
  purge_protection_enabled = true
}

data "azurerm_client_config" "current" {}

## PostgreSQL Flexible server
resource "azurerm_postgresql_flexible_server" "main" {
  name = "uniquepostgrespa"
  resource_group_name = azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  version = "13"

  administrator_login = "pgadmin"
  administrator_password = var.postgres_admin_password
  storage_mb = 32768
  sku_name = "B_Standard_B1ms"
  backup_retention_days = 7
  geo_redundant_backup_enabled = false

  delegated_subnet_id = null
}

## Synapse workspace
resource "azurerm_synapse_workspace" "main" {
  name = "uniquesynpa"
  resource_group_name = azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.main.id
  sql_administrator_login = "synadmin"
  sql_administrator_login_password = var.synapse_admin_password
}

resource "azurerm_storage_data_lake_gen2_filesystem" "main" {
  name = "synapsefs"
  storage_account_id = azurerm_storage_account.datalake.id
}

## App Service Plan + Web App
resource "azurerm_service_plan" "main" {
  name = "pa-webapp-plan"
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  os_type = "Linux"
  sku_name = "B1"
}

resource "azurerm_linux_web_app" "portal" {
  name = "pa-webapp"
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  service_plan_id = azurerm_service_plan.main.id

  site_config {always_on = true}
}