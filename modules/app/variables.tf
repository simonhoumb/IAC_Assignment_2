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

variable "svc_plan_prefix" {
  type        = string
  description = "Name of Service Plan."
  default     = "svcplan"
}

variable "web_app_prefix" {
  type        = string
  description = "Name of Web App."
  default     = "web"
}

variable "web_app_worker_count" {
  type        = number
  description = "Number of Web App Workers."
  default     = 1
}

variable "database_url" {
  type        = string
  description = "URL of web app database."
  default     = ""
}

variable "storage_connection_string" {
  type        = string
  description = "Primary connection string of storage account."
  default     = ""
  sensitive   = true
}

variable "subnet_id" {
  type        = string
  description = "ID of subnet."
  default     = ""
}

variable "storage_account_primary_access_key" {
  type        = string
  description = "Primary access key of storage account."
  default     = ""
  sensitive   = true
}

variable "storage_account_name" {
  type        = string
  description = "Name of storage account."
  default     = ""
}

variable "storage_container_name" {
  type        = string
  description = "Name of storage container."
  default     = ""
}
