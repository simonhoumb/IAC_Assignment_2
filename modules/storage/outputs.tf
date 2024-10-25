output "storage_connection_string" {
  description = "The primary connection string of the blob storage account."
  value       = azurerm_storage_account.sa.primary_connection_string
}
