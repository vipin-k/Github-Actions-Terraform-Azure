output "app_name" {
  value = {
    application_name = azuread_application.webdb.display_name #A
  }
}