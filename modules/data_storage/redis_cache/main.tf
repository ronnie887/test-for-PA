module "redis_cache" {
  source  = "Azure/avm-res-cache-redis/azurerm"
  version = "~> 0.4"

  name                = "redis-${var.project_name}-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location

  zones = var.redis_sku_name == "Premium" ? var.zones : null
  capacity = var.redis_capacity
  #family   = var.family
  sku_name = var.redis_sku_name

  enable_non_ssl_port = var.environment != "prod"
  minimum_tls_version = "1.2"

  tags = var.tags
}
