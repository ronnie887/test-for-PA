output "name" {
  description = "Name of the managed identity"
  value       = module.managed_identity.resource.name
}

output "resource_id" {
  description = "Resource ID of the managed identity"
  value       = module.managed_identity.resource_id
}

output "client_id" {
  description = "Client ID of the managed identity"
  value       = module.managed_identity.client_id
}

output "principal_id" {
  description = "Principal ID of the managed identity"
  value       = module.managed_identity.principal_id
}
