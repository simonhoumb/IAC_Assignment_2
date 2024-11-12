variable "subscription_id" {
  type        = string
  description = "Azure subscription ID required for use."
  default     = ""
}

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

# App Variables
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

variable "web_app_slot_name" {
  type        = string
  description = "Name of Web App Slot."
  default     = "webslot"
}

variable "web_app_worker_count" {
  type        = number
  description = "Number of Web App Workers."
  default     = 1
}

variable "go_version" {
  type        = string
  description = "Version of Golang used in Web App."
  default     = "1.19"
}

# Database Variables
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

# Network Variables
variable "nsg_prefix" {
  type        = string
  description = "Name of Network Security Group."
  default     = "nsg"
}

variable "source_address_prefix" {
  type        = string
  description = "Allowed Source Address Prefix to connect"
  default     = "129.241.0.20"
}

variable "vnet_prefix" {
  type        = string
  description = "Name of Virtual Network."
  default     = "vnet"
}

variable "subnet_prefix" {
  type        = string
  description = "Name of Subnet."
  default     = "subnet"
}

variable "lb_prefix" {
  type        = string
  description = "Name of Load Balancer."
  default     = "lb"
}

# Storage Variables
variable "sa_prefix" {
  type        = string
  description = "Name of Storage Account."
  default     = "sa"
}
