resource "azurerm_resource_group" "rg" {
  name     = "${var.rg_name}${local.naming_suffix_seperated}"
  location = var.location
}

module "app" {
  source                    = "../modules/app"
  rg_name                   = azurerm_resource_group.rg.name
  location                  = var.location
  svc_plan_prefix           = var.svc_plan_prefix
  web_app_prefix            = var.web_app_prefix
  web_app_instance_count    = var.web_app_instance_count
  web_app_worker_count      = var.web_app_worker_count
  database_url              = module.database.database_url
  storage_connection_string = module.storage.storage_connection_string
  subnet_id                 = module.network.subnet_id

  depends_on = [module.database, module.network, module.storage]
}

module "database" {
  source                                = "../modules/database"
  rg_name                               = azurerm_resource_group.rg.name
  location                              = var.location
  mssqlserver_prefix                    = var.mssqlserver_prefix
  mssqldb_prefix                        = var.mssqldb_prefix
  mssqlserver_admin_username            = var.mssqlserver_admin_username
  storage_account_primary_access_key    = module.storage.storage_account_primary_access_key
  storage_account_primary_blob_endpoint = module.storage.storage_account_primary_blob_endpoint

  depends_on = [module.storage]
}

module "network" {
  source                = "../modules/network"
  rg_name               = azurerm_resource_group.rg.name
  location              = var.location
  nsg_prefix            = var.nsg_prefix
  source_address_prefix = var.source_address_prefix
  vnet_prefix           = var.vnet_prefix
  subnet_prefix         = var.subnet_prefix
  lb_prefix             = var.lb_prefix
}

module "storage" {
  source                         = "../modules/storage"
  rg_name                        = azurerm_resource_group.rg.name
  location                       = var.location
  sa_prefix                      = var.sa_prefix
  image_container_instance_count = var.image_container_instance_count
}
