# Key Vault Outputs
output "key_vault" {
  description = "Key Vault information"
  value = {
    name = module.key_vault.key_vault_name
    uri  = module.key_vault.key_vault_uri
    id   = module.key_vault.key_vault_resource_id
  }
}