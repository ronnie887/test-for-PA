data "terraform_remote_state" "rg_ad" {
  backend = "local"
  config = {
    path = "../rg_ad/terraform.tfstate"
  }
}

data "terraform_remote_state" "iam" {
  backend = "local"
  config = {
    path = "../iam/terraform.tfstate"
  }
}

data "terraform_remote_state" "df_sa" {
  backend = "local"
  config = {
    path = "../df_sa/terraform.tfstate"
  }
}