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