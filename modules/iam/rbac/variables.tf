variable "resource_group_id" {
  description = "Resource ID of the resource group"
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

variable "storage_account_id" {
  description = "Resource ID for the Function App's storage account"
  type        = string
}
