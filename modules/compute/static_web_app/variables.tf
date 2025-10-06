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
