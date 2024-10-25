resource "azurerm_resource_group" "rg_backend" {
  name     = "${var.rg_backend_name}-${local.common_tags.owner}-${local.common_tags.backend}-${local.common_tags.project}-${local.common_tags.environment}-${var.backend_location}"
  location = var.backend_location
  tags     = local.common_tags
}

resource "random_string" "random_string" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa_backend" {
  name                     = "${lower(var.sa_backend_name)}${local.common_tags.project}${local.common_tags.environment}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.rg_backend.name
  location                 = azurerm_resource_group.rg_backend.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  min_tls_version          = "TLS1_2"
  queue_properties {
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "1.0"
      retention_policy_days = 10
    }
  }
  tags = local.common_tags
}

resource "azurerm_storage_container" "sa_backend_container" {
  name                  = var.sa_backend_container_name
  storage_account_name  = azurerm_storage_account.sa_backend.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.sa_backend]
}
