variable "resource_group_name" {
  description = "Name of the Resource Group"
  type = string
  default = "rg-1"
}

variable "location" {
  description = "Azure region for all resources"
  type = string
  default = "canadacentral"
}

variable "postgres_admin_password" {
  description = "Password for PostgreSQL admin user"
  type = string
  sensitive = true
}

variable "synapse_admin_password" {
  description = "Password for Synapse admin user"
  type = string
  sensitive = true
}