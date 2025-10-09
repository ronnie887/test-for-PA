variable "name" {
  description = "The name of the app service plan"
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

variable "app_service_plan_sku_name" {
  description = "SKU name for the App Service Plan"
  type        = string
}

variable "tags" {
  description = "Tags for web services"
  type        = map(string)
}

