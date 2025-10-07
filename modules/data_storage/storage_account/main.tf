# ADLS Gen2 Storage Account
module "storage_account" {
  source  = "Azure/avm-res-storage-storageaccount/azurerm"
  version = "~> 0.6"

  name                = "stadls${replace(var.project_name, "-", "")}${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location
  
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true

  shared_access_key_enabled = true

  containers = {
    landing = {
      name                  = "landing"
      container_access_type = "private"
    }
    
    raw = {
      name                  = "raw"
      container_access_type = "private"
    }
    export = {
      name                  = "export"
      container_access_type = "private"
    }
    rejected = {
      name                  = "rejected"
      container_access_type = "private"
    }
    archive = {
      name                  = "archive"
      container_access_type = "private"
    }

    bronze = {
      name                  = "bronze"
      container_access_type = "private"
    }
    # erp >> client_name >> file.ext
    # benchmarking >> client_name >> file.ext 

    silver = {
      name                  = "silver"
      container_access_type = "private"
    }
    gold = {
      name                  = "gold"
      container_access_type = "private"
    }
  }

  role_assignments = {
    managed_identity_contributor = {
      role_definition_id_or_name = "Storage Blob Data Contributor"
      principal_id               = var.managed_identity_principal_id
    }
  }

  tags = var.tags
}
