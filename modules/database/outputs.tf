output "database_url" {
  description = "URL of web app database"
  value       = "jdbc:sqlserver://${azurerm_mssql_server.mssqlserver.name}.database.windows.net:1433;database=${azurerm_mssql_database.mssqldb.name};user=${azurerm_mssql_server.mssqlserver.administrator_login}@${azurerm_mssql_server.mssqlserver.name};password=${azurerm_mssql_server.mssqlserver.administrator_login_password};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;"
}
