output "storageaccount_name" {
  value = {
    sta_name = azurerm_storage_account.STA.name #A
  }
}