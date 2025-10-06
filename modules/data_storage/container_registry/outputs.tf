output "name" {
  value = module.container_registry.name
}

output "resource_id" {
  value = module.container_registry.resource_id
}

output "resource" {
  value = module.container_registry.resource
}

#output "login_server" {
#  value       = module.container_registry.login_server
#}
#output "admin_username" {
#  value       = module.container_registry.admin_username
#  sensitive   = true
#}
#output "admin_password" {
#  value       = module.container_registry.admin_password
#  sensitive   = true
#}

