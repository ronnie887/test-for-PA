data "terraform_remote_state" "rg_ad" {
  backend = "local"
  config = {
    path = "../rg_ad/terraform.tfstate"
  }
}

data "azurerm_client_config" "current" {}
