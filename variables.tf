variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "centralus"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-test-terra"
}

variable "adls_storage_account_name" {
  description = "Name of the storage account name"
  type        = string
  default     = "sapasa"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "key_vault_name" {
  description = "Name of the Azure Key vault "
  type = string
  default = "kvasach3"
}

variable "postgres_server_name" {
  description = "Name of the PostgreSQL server"
  type = string
  default = "postgres-server"
}

variable "postgres_admin_username" {
  description = "Administrator username for PostgreSQL"
  type        = string
  default     = "pgadmin"
  sensitive   = true
}

variable "postgres_admin_password" {
  description = "Administrator password for PostgreSQL"
  type        = string
  sensitive   = true
  default     = "P@ssw0rd123!" # Change this in production!
}

variable "postgres_database_name" {
  description = "Name of the PostgreSQL database"
  type        = string
  default     = "db"
}

variable "container_registry_name" {
  description = "Name of the Azure Container Registry (prefix)"
  type        = string
  default     = "acr"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "asp"
}

variable "web_app_name" {
  description = "Name of the Web App (prefix)"
  type        = string
  default     = "webapp"
}

variable "data_factory_name" {
  description = "Name of the Azure Data Factory (prefix)"
  type        = string
  default     = "adf"
}

variable "app_name" {
  description = "Name of the Azure AD application"
  type        = string
  default     = "integrix"
}

variable "static_web_app_name" {
  description = "Name of the Static web app"
  type = string
  default = "swa"
}

variable "function_app_name" {
  description = "Name of the function app"
  type = string
  default = "func"
}

variable "function_app_plan_name" {
  description = "Name of the function app service plan"
  type = string
  default = "func-plan"
}

variable "function_storage_name" {
  description = "Name of the storage account for Function App"
  type = string
  default = "funcst"
}

variable "redis_cache_name" {
  description = "Name of the Redis Cache"
  type = string
  default = "redis"
}