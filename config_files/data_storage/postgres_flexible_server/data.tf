data "terraform_remote_state" "resource_group" {
  backend = "azurerm"
  config = {
    resource_group_name  = "pa-tfstate-rg"
    storage_account_name = "patfstatestorage"
    container_name       = "tfstate"
    key = "config_files/resource_group/terraform.tfstate"
  }
}