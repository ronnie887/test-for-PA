# Storage Outputs
output "storage" {
  description = "Storage accounts information"
  value = {
    storage_account_name = module.storage_account.name
    storage_account_id   = module.storage_account.id
  }
}
