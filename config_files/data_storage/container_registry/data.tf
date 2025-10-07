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
