output "managed_identity_role_assignment_id" {
  description = "ID of the managed identity role assignment"
  value       = module.role_assignment_managed_identity_contributor.resource_id
}

output "service_principal_role_assignment_id" {
  description = "ID of the service principal role assignment"  
  value       = module.role_assignment_service_principal_reader.resource_id
}
