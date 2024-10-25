variable "rg_name" {
  type        = string
  description = "Name of Resource Group."
  default     = "rg"
}

variable "location" {
  type        = string
  description = "Location of Resource Group/Resource."
  default     = "westeurope"
}

variable "mssqlserver_prefix" {
  type        = string
  description = "Name of MSSQL Server."
  default     = "mssqlserver"
}

variable "mssqldb_prefix" {
  type        = string
  description = "Name of MSSQL Database name."
  default     = "mssqldb"
}

variable "mssqlserver_admin_username" {
  type        = string
  description = "Username of MSSQL Server Admin."
  default     = ""
  sensitive   = true
}
