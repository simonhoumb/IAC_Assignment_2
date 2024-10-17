resource "azurerm_service_plan" "svc_plan" {
  name                = var.svc_plan_name
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "web_app" {
  name                = var.web_app_name
  resource_group_name = var.rg_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.svc_plan.id
  count               = var.web_app_instance_count

  site_config {
    http2_enabled       = true
    minimum_tls_version = "1.2"
    worker_count        = var.web_app_worker_count
    health_check_path   = "/health"
  }
}
