variable "name" {
  description = "The name of the synapse workspace"
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

variable "filesystem_id" {
  description = "Resource ID of the ADLS Gen2 filesystem for Synapse"
  type        = string
}

variable "sql_admin_username" {
  description = "SQL administrator username"
  type        = string
}

variable "sql_admin_password" {
  description = "SQL administrator password"
  type        = string
  sensitive   = true
}

variable "managed_identity_resource_id" {
  description = "Resource ID of the managed identity"
  type        = string
}

variable "tags" {
  description = "Tags for the Synapse workspace"
  type        = map(string)
}
