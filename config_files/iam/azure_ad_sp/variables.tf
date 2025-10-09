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

#variable "tags" {
#  description = "Common tags for all resources"
#  type        = map(string)
#  default     = {}
#}

# Azure AD App Configuration
#variable "azure_ad_app_name" {
#  description = "Name for Azure AD application"
#  type        = string
#  default     = "PA-IntegriX-Dev"
#}
