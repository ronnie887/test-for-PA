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

data "terraform_remote_state" "container_registry" {
  backend = "local"
  config = {
    path = "../../data_storage/container_registry/terraform.tfstate"
  }
}

data "terraform_remote_state" "app_service_plan" {
  backend = "local"
  config = {
    path = "../../compute/app_service_plan/terraform.tfstate"
  }
}