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
