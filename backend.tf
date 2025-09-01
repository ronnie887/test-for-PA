terraform {
  backend "azurerm" {
    resource_group_name = "rg-tfstate"
    storage_account_name = "tfstatesapa"
    container_name = "tfstate"
    key = "infra.terraform.tfstate"
  }
}