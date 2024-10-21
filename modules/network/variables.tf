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

variable "nsg_name" {
  type        = string
  description = "Name of Network Security Group."
  default     = "nsg-${local.common_tags.owner}-${local.common_tags.project}-${local.common_tags.environment}-${var.location}"
}

variable "source_address_prefix" {
  type        = string
  description = "Allowed Source Address Prefix to connect"
  default     = "129.241.0.20"
}

variable "vnet_name" {
  type        = string
  description = "Name of Virtual Network."
  default     = "vnet-${local.common_tags.owner}-${local.common_tags.project}-${local.common_tags.environment}-${var.location}"
}

variable "subnet_name" {
  type        = string
  description = "Name of Subnet."
  default     = "subnet-${local.common_tags.owner}-${local.common_tags.project}-${local.common_tags.environment}-${var.location}"
}

variable "lb_name" {
  type        = string
  description = "Name of Load Balancer."
  default     = "lb-${local.common_tags.owner}-${local.common_tags.project}-${local.common_tags.environment}-${var.location}"
}
