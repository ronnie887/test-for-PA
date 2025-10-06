output "name" {
  description = "Name of the data factory"
  value       = module.data_factory.name
}

output "id" {
  description = "Resource ID of the data factory"
  value       = module.data_factory.resource_id
}

output "identity" {
  description = "Identity information of the data factory"
  value       = module.data_factory.resource.identity
}
