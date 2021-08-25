terraform {
  backend "azurerm" {
    resource_group_name   = "terraform"
    storage_account_name  = "terraform007"
    container_name        = "tfstate"
    key                   = "dev.terraform.tfstate"
  }
}
module "AppRegistration" {
  source    = "./modules/AppRegistration" #A
  appname = var.appname #B
  
}