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

# Redis Configuration
variable "redis_capacity" {
  description = "Redis cache capacity"
  type        = number
  default     = 0
}

#variable "redis_family" {
#  description = "Redis cache family"
#  type        = string
#  default     = "C"
#}

variable "redis_sku_name" {
  description = "Redis cache SKU name"
  type        = string
  default     = "Basic"
}
