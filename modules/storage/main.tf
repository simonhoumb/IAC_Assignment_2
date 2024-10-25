resource "random_string" "random_string" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa" {
  name                     = "${lower(var.sa_prefix)}${local.naming_suffix_not_seperated}${random_string.random_string.result}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  min_tls_version          = "TLS1_2"
  sas_policy {
    expiration_period = "90.00:00:00"
    expiration_action = "Log"
  }
  blob_properties {
    delete_retention_policy {
      days = 7
    }
  }
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

resource "azurerm_storage_container" "image_container" {
  count                 = var.image_container_instance_count
  name                  = "product-images-${format("%02d", count.index + 1)}"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}
