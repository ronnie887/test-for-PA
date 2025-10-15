variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = ""
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {}
}

# Database Configuration
variable "postgresql_admin_username" {
  description = "PostgreSQL administrator username"
  type        = string
  default     = "psqladmin"
}

variable "postgresql_admin_password" {
  description = "PostgreSQL administrator password"
  type        = string
  sensitive   = true
}
