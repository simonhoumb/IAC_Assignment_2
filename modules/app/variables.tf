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

variable "web_app_instance_count" {
  type        = number
  description = "Number of Web App Instances."
  default     = 1
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
}

variable "subnet_id" {
  type        = string
  description = "ID of subnet."
  default     = ""
}
