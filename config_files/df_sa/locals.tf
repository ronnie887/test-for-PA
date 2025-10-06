locals {
  # Common naming convention
  resource_suffix = "${var.project_name}-${var.environment}"
  
  # Common tags
  common_tags = merge(var.tags, {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    CreatedAt   = timestamp()
  })
}
