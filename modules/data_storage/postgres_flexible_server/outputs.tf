output "server_name" {
  description = "Name of the PostgreSQL server"
  value       = module.postgresql_server.name
}

output "server_fqdn" {
  description = "FQDN of the PostgreSQL server"
  value       = module.postgresql_server.fqdn
}

output "server_id" {
  description = "Resource ID of the PostgreSQL server"
  value       = module.postgresql_server.resource_id
}
