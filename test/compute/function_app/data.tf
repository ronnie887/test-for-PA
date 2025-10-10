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

data "terraform_remote_state" "storage_account" {
  backend = "azurerm"
  config = {
    resource_group_name  = "pa-tfstate-rg-01"
    storage_account_name = "patfstatestorage02"
    container_name       = "tfstate"
    key = "test/data_storage/storage_account/terraform.tfstate"
  }
}

data "terraform_remote_state" "app_service_plan" {
  backend = "azurerm"
  config = {
    resource_group_name  = "pa-tfstate-rg-01"
    storage_account_name = "patfstatestorage02"
    container_name       = "tfstate"
    key = "test/compute/app_service_plan/terraform.tfstate"
  }
}