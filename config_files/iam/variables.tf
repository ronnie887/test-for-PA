variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "centralus"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {}
}

# Key Vault
variable "secrets_value" {
  description = "Map of secrets for Key Vault"
  type        = map(string)
  default     = {}
  sensitive   = true
}

#variable "secrets_value" {
#  type = map(string)
#  description = "Map of secrets"
#}
