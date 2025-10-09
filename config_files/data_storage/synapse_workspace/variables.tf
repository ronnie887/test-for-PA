variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "pa-integrix"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "test"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "centralus"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {
    Owner      = "DevTeam"
    Environment = "Development"
    CostCenter = "Engineering"
    Project    = "PA-integriX"
    ManagedBy   = "Terraform"
  }
}

# Synapse Configuration
variable "synapse_sql_admin_username" {
  description = "Synapse SQL administrator username"
  type        = string
  default     = "sqladmin"
}

variable "synapse_sql_admin_password" {
  description = "Synapse SQL administrator password"
  type        = string
  sensitive   = true
  default     = "DevSynapsePassword123!"
}