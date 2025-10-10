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

# Container Registry
variable "zone_redundancy_enabled" {
  description = "Enable zone redundancy for Container Registry"
  type        = bool
  default     = true
}