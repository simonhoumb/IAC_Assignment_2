
variable "rg_backend_name" {
  type        = string
  description = "Name of Backend Resource Group"
  default     = "rg-${local.common_tags.owner}-${local.common_tags.project}-${local.common_tags.environment}-${var.backend_location}"
}

variable "backend_location" {
  type        = string
  description = "Location of Backend Resource Group"
  default     = "westeurope"
}

variable "sa_backend_name" {
  type        = string
  description = "Name of Backend Storage Account"
  default     = "sabe${local.common_tags.owner}${local.common_tags.project}${local.common_tags.environment}${var.location}"
}

variable "sa_backend_container_name" {
  type        = string
  description = "Name of Backend Storage Account Container"
  default     = "tfstate"
}
