resource "azuread_application" "webdb" {
  display_name               = var.appname
  available_to_other_tenants = false
  }