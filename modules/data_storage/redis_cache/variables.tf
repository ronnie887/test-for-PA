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

variable "redis_capacity" {
  description = "Redis cache capacity"
  type        = number
}

#variable "family" {
#  description = "Redis cache family"
#  type        = string
#}

variable "redis_sku_name" {
  description = "Redis cache SKU name"
  type        = string
}

variable "tags" {
  description = "Tags for the redis cache"
  type        = map(string)
}


variable "zones" {
  description = "Availability zones for Premium SKU (not applicable for Basic/Standard)"
  type        = list(string)
  default     = null
}