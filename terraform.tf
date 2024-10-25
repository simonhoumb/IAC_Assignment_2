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
    resource_group_name  = "rg-simonhou-backend-oppg2-prod-westeurope"
    storage_account_name = "sabeoppg2prodp879"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
