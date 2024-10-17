resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_mssql_server" "mssqlserver" {
  name                         = var.mssqlserver_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.mssqlserver_admin_username
  administrator_login_password = random_password.password.result
  tags                         = local.common_tags
}

resource "azurerm_mssql_database" "mssqldb" {
  name         = var.mssqldb_name
  server_id    = azurerm_mssql_server.mssqlserver.name
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
  tags         = local.common_tags

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}