terraform {
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "terraformcodes"
    container_name       = "tfstatefile"
    key                  = "dev.terraform.tfstate"
  }
}

module "RAE" {
  source   = "./modules/RAE"
  sname    = var.sname
  rgname   = var.rgname
  location = var.location
  password = var.password
}