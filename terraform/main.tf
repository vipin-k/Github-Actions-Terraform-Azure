terraform {
  backend "azurerm" {
    resource_group_name  = "TerraformDemo01"
    storage_account_name = "terraformcodeops01"
    container_name       = "tfstatefile01"
    key                  = "dev.terraform.tfstate01"
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
