resource "random_string" "random_string" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa" {
  name                     = "${lower(var.sa_name)}${random_string.random_string.result}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.common_tags
}

resource "azurerm_storage_container" "image_container" {
  count                 = var.image_container_instance_count
  name                  = "product-images-${format("%02d", count.index)}"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}
