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
