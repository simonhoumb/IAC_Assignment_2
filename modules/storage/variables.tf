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

variable "sa_name" {
  type        = string
  description = "Name of Storage Account."
  default     = "sa${local.common_tags.owner}${local.common_tags.project}${local.common_tags.environment}${var.location}"
}

variable "image_container_instance_count" {
  type        = number
  description = "Number of Image Container Instances."
  default     = 1
}
