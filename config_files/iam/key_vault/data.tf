data "terraform_remote_state" "resource_group" {
  backend = "azurerm"
  config = {
    resource_group_name  = "pa-tfstate-rg"
    storage_account_name = "patfstatestorage"
    container_name       = "tfstate"
    key = "config_files/resource_group/terraform.tfstate"
  }
}

data "terraform_remote_state" "uami" {
  backend = "azurerm"
  config = {
    resource_group_name  = "pa-tfstate-rg"
    storage_account_name = "patfstatestorage"
    container_name       = "tfstate"
    key = "config_files/iam/uami/terraform.tfstate"
  }
}

data "terraform_remote_state" "azure_ad_sp" {
  backend = "azurerm"
  config = {
    resource_group_name  = "pa-tfstate-rg"
    storage_account_name = "patfstatestorage"
    container_name       = "tfstate"
    key = "config_files/iam/azure_ad_sp/terraform.tfstate"
  }
}

data "azurerm_client_config" "current" {}
