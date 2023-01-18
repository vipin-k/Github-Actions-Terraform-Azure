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


resource "azurerm_mssql_server" "mtc-sqlserver" {
  name                         = "mssqlserver01122023"
  resource_group_name          = var.rgname
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "adminadmin"
  administrator_login_password = "Password123456"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_mssql_database" "RAEdb" {
  name           = "RAEdb"
  server_id      = azurerm_mssql_server.mtc-sqlserver.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  
}

resource "azurerm_mssql_database" "ETRAEdb" {
  name           = "ETRAEdb"
  server_id      = azurerm_mssql_server.mtc-sqlserver.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"

  
ledger_enabled = true
  
}