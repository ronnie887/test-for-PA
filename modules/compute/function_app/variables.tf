variable "name" {
  description = "The name of the function app"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "managed_identity_resource_id" {
  description = "Resource ID of the managed identity"
  type        = string
}

variable "tags" {
  description = "Tags for web services"
  type        = map(string)
}

variable "service_plan_id" {
  description = "Resource ID of the App Service Plan"
  type        = string
}

# Storage account name for UAMI access
variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}
