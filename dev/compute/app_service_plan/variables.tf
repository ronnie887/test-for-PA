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