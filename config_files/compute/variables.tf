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

# App Service Plan Configuration
variable "app_service_plan_sku_name" {
  description = "SKU name for the App Service Plan"
  type        = string
  default     = "S1"
}

variable "zone_balancing_enabled" {
  description = "Enable zone balancing for App Service Plan"
  type        = bool
  default     = false
}


