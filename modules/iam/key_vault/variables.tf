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

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}

variable "managed_identity_principal_id" {
  description = "Principal ID of the managed identity"
  type        = string
}

variable "service_principal_object_id" {
  description = "Object ID of the service principal"
  type        = string
}

#variable "sp_client_id" {
#  description = "Service principal client ID"
#  type        = string
#  sensitive   = true
#}

#variable "sp_client_secret" {
#  description = "Service principal client secret"
#  type        = string
#  sensitive   = true
#}

variable "tags" {
  description = "Tags for the key vault"
  type        = map(string)
}

#variable "secrets_value" {
#  description = "Map of secrets for Key Vault"
#  type        = map(string)
#  default     = {}
#  sensitive   = true
#}