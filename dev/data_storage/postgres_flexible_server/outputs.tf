# Database Outputs
output "postgresql_server" {
  description = "Database information"
  value = {
    server_name = module.postgresql_server.server_name
    server_fqdn = module.postgresql_server.server_fqdn
    server_id   = module.postgresql_server.server_id
  }
  sensitive = true
}
