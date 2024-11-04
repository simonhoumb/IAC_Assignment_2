
variable "rg_backend_prefix" {
  type        = string
  description = "Name of Backend Resource Group"
  default     = "rg"
}

variable "backend_location" {
  type        = string
  description = "Location of Backend Resource Group"
  default     = "westeurope"
}

variable "sa_backend_prefix" {
  type        = string
  description = "Name of Backend Storage Account"
  default     = "sabe"
}

variable "sa_backend_container_name" {
  type        = string
  description = "Name of Backend Storage Account Container"
  default     = "tfstate"
}
