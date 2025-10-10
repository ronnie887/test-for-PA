# Redis Cache Outputs
output "redis_cache" {
  description = "Redis Cache information"
  value = {
    name     = module.redis_cache.name
    hostname = module.redis_cache.hostname
    port     = module.redis_cache.port
    ssl_port = module.redis_cache.ssl_port
  }
  sensitive = true
}