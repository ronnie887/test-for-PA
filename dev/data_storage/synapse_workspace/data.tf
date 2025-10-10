data "terraform_remote_state" "resource_group" {
  backend = "azurerm"
  config = {
    resource_group_name  = "pa-tfstate-rg-01"
    storage_account_name = "patfstatestorage02"
    container_name       = "tfstate"
    key = "dev/resource_group/resource_group/terraform.tfstate"
  }
}

data "terraform_remote_state" "uami" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-integrix-tfstate" #check
    storage_account_name = "stintegrixtfstatedev" #check
    container_name       = "tfstate"
    key = "dev/iam/uami/terraform.tfstate"
  }
}

data "terraform_remote_state" "storage_account" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-integrix-tfstate" #check
    storage_account_name = "stintegrixtfstatedev" #check
    container_name       = "tfstate"
    key = "dev/data_storage/storage_account/terraform.tfstate"
  }
}