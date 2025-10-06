# Managed Identity Outputs
output "managed_identity" {
  description = "Managed Identity information"
  value = {
    name         = module.managed_identity.name
    resource_id  = module.managed_identity.resource_id
    client_id    = module.managed_identity.client_id
    principal_id = module.managed_identity.principal_id
  }
}

# Key Vault Outputs
output "key_vault" {
  description = "Key Vault information"
  value = {
    name = module.key_vault.key_vault_name
    uri  = module.key_vault.key_vault_uri
    id   = module.key_vault.key_vault_resource_id
  }
}
