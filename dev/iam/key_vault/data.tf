data "terraform_remote_state" "resource_group" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-integrix-tfstate" #check
    storage_account_name = "stintegrixtfstatedev" #check
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

data "terraform_remote_state" "azure_ad_sp" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-integrix-tfstate" #check
    storage_account_name = "stintegrixtfstatedev" #check
    container_name       = "tfstate"
    key = "dev/iam/azure_ad_sp/terraform.tfstate"
  }
}

data "azurerm_client_config" "current" {}
