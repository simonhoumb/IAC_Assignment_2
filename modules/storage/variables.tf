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

variable "sa_prefix" {
  type        = string
  description = "Name of Storage Account."
  default     = "sa"
}

variable "image_container_instance_count" {
  type        = number
  description = "Number of Image Container Instances."
  default     = 1
}
