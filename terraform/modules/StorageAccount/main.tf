resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.location
}


resource "azurerm_storage_account" "STA" {
  name                     = var.sname
  resource_group_name      = var.rgname
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_mssql_server" "mtc-sqlserver" {
  name                         = "mssqlserver01122023"
  resource_group_name          = var.rgname
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "adminadmin"
  administrator_login_password = ${{ secrets.AZURE_AD_CLIENT_ID }}
  tags = {
    environment = "dev"
  }
}