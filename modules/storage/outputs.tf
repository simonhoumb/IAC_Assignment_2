output "storage_connection_string" {
  description = "The primary connection string of the blob storage account."
  value       = azurerm_storage_account.sa.primary_connection_string
  sensitive   = true
}

output "storage_account_primary_access_key" {
  description = "The primary access key of the storage account."
  value       = azurerm_storage_account.sa.primary_access_key
  sensitive   = true
}

output "storage_account_name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.sa.name
}

output "storage_account_primary_blob_endpoint" {
  description = "The primary blob endpoint key of the storage account."
  value       = azurerm_storage_account.sa.primary_blob_endpoint
  sensitive   = true
}

output "storage_container_name" {
  description = "The name of the storage container."
  value       = azurerm_storage_container.image_container.name
}
