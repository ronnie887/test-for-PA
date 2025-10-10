data "terraform_remote_state" "resource_group" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-integrix-tfstate" #check
    storage_account_name = "stintegrixtfstateprod" #check
    container_name       = "tfstate" #check
    key = "prod/resource_group/resource_group/terraform.tfstate"
  }
}

data "terraform_remote_state" "uami" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-integrix-tfstate" #check
    storage_account_name = "stintegrixtfstateprod" #check
    container_name       = "tfstate" #check
    key = "prod/iam/uami/terraform.tfstate"
  }
}

data "terraform_remote_state" "storage_account" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-integrix-tfstate" #check
    storage_account_name = "stintegrixtfstateprod" #check
    container_name       = "tfstate" #check
    key = "prod/data_storage/storage_account/terraform.tfstate"
  }
}

data "terraform_remote_state" "app_service_plan" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-integrix-tfstate" #check
    storage_account_name = "stintegrixtfstateprod" #check
    container_name       = "tfstate" #check
    key = "prod/compute/app_service_plan/terraform.tfstate"
  }
}