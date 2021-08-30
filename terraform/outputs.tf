output "rg_name" {
  value = {
    appname = module.RG.resourcegroup_name.rg_name
  }
}