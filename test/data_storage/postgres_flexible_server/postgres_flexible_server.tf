provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  subscription_id = "adde48e9-ba85-4182-af13-13f9385a101c"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "pa-tfstate-rg-01"
    storage_account_name = "patfstatestorage02"
    container_name       = "tfstate"
    key                  = "test/data_storage/postgres_flexible_server/terraform.tfstate"
  }
}

## Database (AVM) - PostgreSQL Flexible Server
module "postgresql_server" {
  source = "../../../modules/data_storage/postgres_flexible_server"
  
  name                = "psql-pa-integrix-test1"
  project_name        = "pa-integrix"
  environment         = "test"
  location            = "centralus"
  resource_group_name = data.terraform_remote_state.resource_group.outputs.resource_group_name
  admin_username      = var.postgresql_admin_username
  admin_password      = var.postgresql_admin_password
  tags                = {
    Owner      = "DevTeam"
    Environment = "Development"
    CostCenter = "Engineering"
    Project    = "PA-integriX"
    ManagedBy   = "Terraform"
    }
}
