resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "random_string" "username" {
  length  = 8
  special = false
}


resource "azurerm_mssql_server" "mssqlserver" {
  name                         = "${var.mssqlserver_prefix}${local.naming_suffix_seperated}"
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.mssqlserver_admin_username == "" ? random_string.username.result : var.mssqlserver_admin_username
  administrator_login_password = random_password.password.result
  minimum_tls_version          = "1.2"
  tags                         = local.common_tags
}

resource "azurerm_mssql_server_extended_auditing_policy" "extended_auditing_policy" {
  server_id                               = azurerm_mssql_server.mssqlserver.id
  storage_endpoint                        = var.storage_account_primary_blob_endpoint
  storage_account_access_key              = var.storage_account_primary_access_key
  storage_account_access_key_is_secondary = true
  retention_in_days                       = 6
  depends_on                              = [azurerm_mssql_server.mssqlserver]
}

resource "azurerm_mssql_database" "mssqldb" {
  name         = "${var.mssqldb_prefix}${local.naming_suffix_seperated}"
  server_id    = azurerm_mssql_server.mssqlserver.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
  tags         = local.common_tags
  depends_on   = [azurerm_mssql_server.mssqlserver]

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
