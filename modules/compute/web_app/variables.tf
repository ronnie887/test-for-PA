#variable "name" {
#  description = "web app name"
#  type = string
#  default = "pa-wp"
#}

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

variable "container_registry_login_server" {
  description = "Container registry login server"
  type        = string
}

#variable "container_registry_admin_username" {
#  description = "Container registry admin username"
#  type        = string
#  sensitive   = true
#}

variable "app_service_plan_sku_name" {
  description = "SKU name for the App Service Plan"
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