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
  count                         = var.web_app_instance_count
  public_network_access_enabled = true
  https_only                    = true
  tags                          = local.common_tags

  app_settings = {
    "DATABASE_URL"                   = var.database_url
    "STORAGE_CONNECTION_STRING"      = var.storage_connection_string
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
