output "name" {
  description = "Name of the Redis cache"
  value       = module.redis_cache.name
}

output "hostname" {
  value = module.redis_cache.resource.hostname
}
output "port" {
  value = module.redis_cache.resource.port
}
output "ssl_port" {
  value = module.redis_cache.resource.ssl_port
}
output "primary_access_key" {
  value = module.redis_cache.resource.primary_access_key
  sensitive = true
}
