data "terraform_remote_state" "resource_group" {
  backend = "azurerm"
  config = {
    resource_group_name  = "pa-tfstate-rg-01"
    storage_account_name = "patfstatestorage02"
    container_name       = "tfstate"
    key = "test/resource_group/resource_group/terraform.tfstate"
  }
}

data "terraform_remote_state" "uami" {
  backend = "azurerm"
  config = {
    resource_group_name  = "pa-tfstate-rg-01"
    storage_account_name = "patfstatestorage02"
    container_name       = "tfstate"
    key = "test/iam/uami/terraform.tfstate"
  }
}

data "terraform_remote_state" "azure_ad_sp" {
  backend = "azurerm"
  config = {
    resource_group_name  = "pa-tfstate-rg-01"
    storage_account_name = "patfstatestorage02"
    container_name       = "tfstate"
    key = "test/iam/azure_ad_sp/terraform.tfstate"
  }
}

data "azurerm_client_config" "current" {}
