variable "subscription_id" {
  type        = string
  description = "Azure subscription ID required for use."
  default     = ""
}

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
