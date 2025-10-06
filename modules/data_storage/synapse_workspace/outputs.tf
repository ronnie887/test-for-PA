output "workspace_name" {
  description = "Name of the Synapse workspace"
  value       = azurerm_synapse_workspace.main.name
}

output "workspace_id" {
  description = "Resource ID of the Synapse workspace"
  value       = azurerm_synapse_workspace.main.id
}

#output "sql_endpoint" {
#  description = "SQL on-demand endpoint of the Synapse workspace"
#  value       = azurerm_synapse_workspace.main.sql_on_demand_endpoint
#  sensitive   = true
#}

output "connectivity_endpoints" {
  description = "Connectivity endpoints of the Synapse workspace"
  value       = azurerm_synapse_workspace.main.connectivity_endpoints
  sensitive   = true
}
