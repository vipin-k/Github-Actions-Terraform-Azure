terraform {
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "terraformcodes"
    container_name       = "tfstatefile"
    key                  = "dev.terraform.tfstate"
  }
}
module "RG" {
  source   = "./modules/RG" #A
  rgname   = var.rgname     #B
  location = var.location
}
module "SA" {
  source   = "./modules/StorageAccount"
  sname    = var.sname
  rgname   = var.rgname
  location = var.location
}

module "sql" {
  source   = "./modules/sql"
 
  rgname   = var.rgname
  location = var.location
}
 
 