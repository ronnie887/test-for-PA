# Create User-Assigned Managed Identity
resource "azurerm_user_assigned_identity" "uami_core" {
  name = "uami-core-${var.environment}--${var.app_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location

  tags = { 
    Environment = var.environment
   }
}

# Azure Resource Group
resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.location
}
# Azure Data Lake Storage Gen2 (ADLS Gen2)
resource "azurerm_storage_account" "adls" {
  name = "${var.adls_storage_account_name}${var.app_name}${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled = true #Hierachical namespace for ADLS Gen2

  tags = {
    Environment = var.environment
  }
}

# Client Config Data Source
data "azurerm_client_config" "current" {}

# Azure Key Vault
resource "azurerm_key_vault" "kv" {
  name = "${var.key_vault_name}-${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List", "Create", "Delete", "Update"
    ]
    secret_permissions = [
      "Get", "List", "Set", "Delete"
    ]
  }

  tags = { 
    Environment = var.environment
   }
}

# PostgreSQL Flexible Server
resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = "${var.postgres_server_name}-${var.app_name}-${var.environment}"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  version                = "13"
  administrator_login    = var.postgres_admin_username
  administrator_password = var.postgres_admin_password

  sku_name               = "B_Standard_B1ms"
  storage_mb             = 32768
  backup_retention_days  = 7

  tags = {
    Environment = var.environment
  }
}

resource "azurerm_postgresql_flexible_server_database" "app_db" {
  name      = var.postgres_database_name
  server_id = azurerm_postgresql_flexible_server.postgres.id
  collation = "en_US.utf8"
  charset   = "utf8"
}

# Container Registry
resource "azurerm_container_registry" "acr" {
  name = "${var.container_registry_name}${var.app_name}${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  sku = "Basic"
  admin_enabled = true

  tags = { 
    Environment = var.environment
   }
}

# App Service Plan
resource "azurerm_service_plan" "app_plan" {
  name = "${var.app_service_plan_name}-${var.app_name}-${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  os_type = "Linux"
  sku_name = "F1"

  tags = {
    Environment = var.environment
   }
}

# Linux Web App with UAMI
resource "azurerm_linux_web_app" "web_app" {
  name                = "${var.web_app_name}-${var.app_name}-${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.app_plan.id

  site_config {
    always_on = false
    application_stack {
      python_version = "3.9"
    }
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.uami_core.id]
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  tags = {
    Environment = var.environment
  }
}

# Data Factory with UAMI
resource "azurerm_data_factory" "adf" {
  name = "${var.data_factory_name}-${var.app_name}-${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.uami_core.id]
  }

  tags = {
    Environment = var.environment
  }
}

# Azure Static Web App
resource "azurerm_static_site" "static_web_app" {
  name                = "${var.static_web_app_name}-${var.app_name}-${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_tier            = "Free"
  sku_size            = "Free"

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.uami_core.id]
  }

  tags = {
    Environment = var.environment
  }
}

# Azure Function App with Consumption Plan
resource "azurerm_service_plan" "function_plan" {
  name                = "${var.function_app_plan_name}-${var.app_name}-${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "Y1"  # Consumption plan

  tags = {
    Environment = var.environment
  }
}

resource "azurerm_linux_function_app" "function_app" {
  name                = "${var.function_app_name}-${var.app_name}-${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.function_plan.id
  storage_account_name       = azurerm_storage_account.function_storage.name
  storage_account_access_key = azurerm_storage_account.function_storage.primary_access_key

  site_config {
    application_stack {
      python_version = "3.9"
    }
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.uami_core.id]
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "python"
    "AzureWebJobsFeatureFlags"  = "EnableWorkerIndexing"
  }

  tags = {
    Environment = var.environment
  }
}

# Storage Account for Function App (required)
resource "azurerm_storage_account" "function_storage" {
  name                     = "${var.function_storage_name}${var.app_name}${var.environment}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Environment = var.environment
  }
}

# Azure Cache for Redis
resource "azurerm_redis_cache" "redis" {
  name                = "${var.redis_cache_name}-${var.app_name}-${var.environment}-${random_string.suffix.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  capacity            = 0    # 250MB for Basic C0
  family              = "C"  # Basic/Standard
  sku_name            = "Basic"
  #enable_non_ssl_port = false
  minimum_tls_version = "1.2"

  #redis_configuration {
    #enable_authentication = true
  #}

  tags = {
    Environment = var.environment
  }
}

# Azure AD App & SP
resource "azuread_application" "app" {
  display_name = "${var.app_name}-${var.environment}"
  web {
    homepage_url  = "https://${azurerm_linux_web_app.web_app.default_hostname}"
    redirect_uris = ["https://${azurerm_linux_web_app.web_app.default_hostname}/auth/callback"]
  }
}

# Role Assignments using UAMI Principal
resource "azurerm_role_assignment" "adf_storage" {
  scope = azurerm_storage_account.adls.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id = azurerm_user_assigned_identity.uami_core.principal_id
  }

resource "azurerm_role_assignment" "webapp_keyvault" {
  scope = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Secrets User"
  principal_id = azurerm_user_assigned_identity.uami_core.principal_id
}

resource "azurerm_role_assignment" "static_web_app_storage" {
  scope = azurerm_storage_account.adls.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id = azurerm_user_assigned_identity.uami_core.principal_id
}