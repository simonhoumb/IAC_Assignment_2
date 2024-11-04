provider "azurerm" {
  # Configuration options
  features {
    key_vault {
      purge_soft_deleted_keys_on_destroy = true
      recover_soft_deleted_keys          = true
    }
  }

  subscription_id = var.subscription_id
}
