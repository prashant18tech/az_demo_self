terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.112.0"
    }
  }
}

provider "azurerm" {
  features {}
  # These environment variables are read automatically from Jenkins:
  # AZURE_CLIENT_ID, AZURE_CLIENT_SECRET, AZURE_TENANT_ID, AZURE_SUBSCRIPTION_ID
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
