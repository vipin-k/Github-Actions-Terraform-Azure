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
  name                         = "mssqlsrver01202023"
  resource_group_name          = var.rgname
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "adminadmin"
  administrator_login_password = var.password
  tags = {
    environment = "dev"
  }
}
