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

variable "svc_plan_name" {
  type        = string
  description = "Name of Service Plan."
  default     = "svcplan-${local.common_tags.owner}-${local.common_tags.project}-${local.common_tags.environment}-${var.location}"
}

variable "web_app_name" {
  type        = string
  description = "Name of Web App."
  default     = "web-${local.common_tags.owner}-${local.common_tags.project}-${local.common_tags.environment}-${var.location}"
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
