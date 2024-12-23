resource "azurerm_service_plan" "svc_plan" {
  name                = "${var.svc_plan_prefix}${local.naming_suffix_seperated}"
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "web_app" {
  name                          = "${var.web_app_prefix}${local.naming_suffix_seperated}"
  resource_group_name           = var.rg_name
  location                      = var.location
  service_plan_id               = azurerm_service_plan.svc_plan.id
  public_network_access_enabled = true
  https_only                    = true
  virtual_network_subnet_id     = var.subnet_id
  tags                          = local.common_tags

  connection_string {
    name  = "DATABASE_URL"
    type  = "MySql"
    value = var.database_url
  }


  storage_account {
    name         = var.storage_account_name
    type         = "AzureBlob"
    access_key   = var.storage_account_primary_access_key
    account_name = var.storage_account_name
    share_name   = var.storage_container_name
  }

  app_settings = {
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = true
  }

  site_config {
    http2_enabled                     = true
    always_on                         = true
    minimum_tls_version               = "1.2"
    worker_count                      = var.web_app_worker_count
    health_check_path                 = "/health"
    health_check_eviction_time_in_min = 5
    ftps_state                        = "FtpsOnly"

  }
}

resource "azurerm_linux_web_app_slot" "web_app_slot" {
  app_service_id                = azurerm_linux_web_app.web_app.id
  name                          = var.web_app_slot_name
  public_network_access_enabled = true

  site_config {
    application_stack {
      go_version = var.go_version
    }
  }

  auth_settings {
    enabled = false
  }

  lifecycle {
    ignore_changes = [
      auth_settings
    ]
  }

  depends_on = [
    azurerm_linux_web_app.web_app
  ]
}
