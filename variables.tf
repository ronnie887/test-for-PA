variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "East US"
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