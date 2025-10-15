variable "project_name" {
  description = "The name of the project"
  type        = string
  default = ""
}

variable "environment" {
  description = "Environment name"
  type        = string
  default = ""
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default = ""
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {}
}
##