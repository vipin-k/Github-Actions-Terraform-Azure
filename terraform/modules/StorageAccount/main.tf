resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.location
}


resource "azurerm_storage_account" "STA" {
  name                     = var.sname
  resource_group_name      = azurerm_resource_group.rg.name
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
  administrator_login_password = "Password12345"
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

# resource "azurerm_mssql_database" "ETRAEdb" {
#   name           = "ETRAEdb"
#   server_id      = azurerm_mssql_server.mtc-sqlserver.id
#   collation      = "SQL_Latin1_General_CP1_CI_AS"
#   license_type   = "LicenseIncluded"

  
#   ledger_enabled = true
  
# }