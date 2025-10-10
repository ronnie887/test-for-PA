variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "pa-integrix"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
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
    Owner      = "ProdTeam"
    Environment = "Production"
    CostCenter = "Engineering"
    Project    = "PA-integriX"
    ManagedBy   = "Terraform"
  }
}

# Redis Configuration
variable "redis_capacity" {
  description = "Redis cache capacity"
  type        = number
  default     = 2
}

variable "redis_sku_name" {
  description = "Redis cache SKU name"
  type        = string
  default     = "Premium"
}
