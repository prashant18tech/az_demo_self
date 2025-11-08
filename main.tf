terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.113.0"
    }
  }

  # (Optional) configure remote backend later if needed
  # backend "azurerm" {
  #   resource_group_name  = "rg-tfstate"
  #   storage_account_name = "tfstatestorageacct"
  #   container_name       = "tfstate"
  #   key                  = "terraform.tfstate"
  # }
}

# Example resource group creation
resource "azurerm_resource_group" "rg" {
  name     = "demo-tf-rg"
  location = "East US"
}

