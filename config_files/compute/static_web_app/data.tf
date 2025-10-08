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
