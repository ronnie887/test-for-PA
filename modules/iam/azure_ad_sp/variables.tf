#variable "app_name" {
#  description = "The name of the ad app"
#  type        = string
#}

#variable "sp_name" {
#  description = "The name of the sp"
#  type        = string
#}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "azure_ad_app_name" {
  description = "Name for Azure AD application"
  type        = string
}
