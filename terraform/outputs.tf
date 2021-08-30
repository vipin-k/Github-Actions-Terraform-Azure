output "rg_name" {
  value = {
    appname = module.RG.resourcegroup_name.rg_name
  }
}
output "Storage_Account_name" {
  value = {
    appname = module.StorageAccount.storageaccount_name.sta_name
  }
}

