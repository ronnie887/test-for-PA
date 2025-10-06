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

# Container Registry Outputs
output "container_registry" {
  description = "Container Registry information"
  value = {
    name         = module.container_registry.name
    login_server = module.container_registry.resource.login_server
    id           = module.container_registry.resource_id
  }
  sensitive = true
}

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

# Synapse Workspace Outputs
output "synapse_workspace" {
  description = "Synapse Workspace information"
  value = {
    workspace_name = module.synapse_workspace.workspace_name
    workspace_id   = module.synapse_workspace.workspace_id
  }
  sensitive = true
}

# RBAC Outputs
output "rbac" {
  description = "RBAC role assignments"
  value = {
    managed_identity_role_assignment_id   = module.rbac.managed_identity_role_assignment_id
    service_principal_role_assignment_id  = module.rbac.service_principal_role_assignment_id
  }
}