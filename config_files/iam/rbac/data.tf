data "terraform_remote_state" "resource_group" {
  backend = "local"
  config = {
    path = "../../resource_group/terraform.tfstate"
  }
}

data "terraform_remote_state" "uami" {
  backend = "local"
  config = {
    path = "../../iam/uami/terraform.tfstate"
  }
}

data "terraform_remote_state" "storage_account" {
  backend = "local"
  config = {
    path = "../../data_storage/storage_account/terraform.tfstate"
  }
}

data "terraform_remote_state" "azure_ad_sp" {
  backend = "local"
  config = {
    path = "../../iam/azure_ad_sp/terraform.tfstate"
  }
}