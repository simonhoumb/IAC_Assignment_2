terraform {
  required_version = ">= 1.9.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.3"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-simonhou-backend"
    storage_account_name = "sabe1416"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
