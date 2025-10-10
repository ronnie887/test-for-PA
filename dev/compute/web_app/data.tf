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

data "terraform_remote_state" "container_registry" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-integrix-tfstate" #check
    storage_account_name = "stintegrixtfstatedev" #check
    container_name       = "tfstate"
    key = "dev/data_storage/container_registry/terraform.tfstate"
  }
}

data "terraform_remote_state" "app_service_plan" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-integrix-tfstate" #check
    storage_account_name = "stintegrixtfstatedev" #check
    container_name       = "tfstate"
    key = "dev/compute/app_service_plan/terraform.tfstate"
  }
}