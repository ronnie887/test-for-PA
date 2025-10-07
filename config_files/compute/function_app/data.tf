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

data "terraform_remote_state" "app_service_plan" {
  backend = "local"
  config = {
    path = "../../compute/app_service_plan/terraform.tfstate"
  }
}