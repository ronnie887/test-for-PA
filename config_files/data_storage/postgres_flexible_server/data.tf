data "terraform_remote_state" "resource_group" {
  backend = "azurerm"
  config = {
    key = "config_files/resource_group/terraform.tfstate"
  }
}