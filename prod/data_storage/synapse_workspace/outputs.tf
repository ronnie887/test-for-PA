# Synapse Workspace Outputs
output "synapse_workspace" {
  description = "Synapse Workspace information"
  value = {
    workspace_name = module.synapse_workspace.workspace_name
    workspace_id   = module.synapse_workspace.workspace_id
  }
  sensitive = true
}