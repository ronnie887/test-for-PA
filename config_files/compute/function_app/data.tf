data "terraform_remote_state" "resource_group" {
  backend = "azurerm"
  config = {
    key = "config_files/resource_group/terraform.tfstate"
  }
}

data "terraform_remote_state" "uami" {
  backend = "azurerm"
  config = {
    key = "config_files/iam/uami/terraform.tfstate"
  }
}

data "terraform_remote_state" "storage_account" {
  backend = "azurerm"
  config = {
    key = "config_files/data_storage/storage_account/terraform.tfstate"
  }
}

data "terraform_remote_state" "app_service_plan" {
  backend = "azurerm"
  config = {
    key = "config_files/compute/app_service_plan/terraform.tfstate"
  }
}