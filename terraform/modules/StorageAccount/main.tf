resource "azurerm_storage_account" "STA" {
  name                     = var.sname
  resource_group_name      = module.RG.resourcegroup_name.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
