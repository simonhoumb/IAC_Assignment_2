variable "rg_name" {
  type        = string
  description = "Name of Resource Group."
  default     = "rg-${local.common_tags.owner}-${local.common_tags.project}-${local.common_tags.environment}-${var.location}"
}

variable "location" {
  type        = string
  description = "Location of Resource Group/Resource."
  default     = "westeurope"
}

variable "mssqlserver_name" {
  type        = string
  description = "Name of MSSQL Server."
  default     = "mssqlserver-${local.common_tags.owner}-${local.common_tags.project}-${local.common_tags.environment}-${var.location}"
}

variable "mssqldb_name" {
  type        = string
  description = "Name of MSSQL Database name."
  default     = "mssqldb-${local.common_tags.owner}-${local.common_tags.project}-${local.common_tags.environment}-${var.location}"
}

variable "mssqlserver_admin_username" {
  type        = string
  description = "Username of MSSQL Server Admin."
  default     = "adminuser"
  sensitive   = true
}
