resource "azurerm_resource_group" "rg_backend" {
  name     = var.rg_backend_name
  location = var.backend_location
  tags     = local.common_tags
}

resource "random_string" "random_string" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa_backend" {
  name                     = "${lower(var.sa_backend_name)}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.rg_backend.name
  location                 = azurerm_resource_group.rg_backend.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags                     = local.common_tags
}

resource "azurerm_storage_container" "sa_backend_container" {
  name                  = var.sa_backend_container_name
  storage_account_name  = azurerm_storage_account.sa_backend.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.sa_backend]
}
