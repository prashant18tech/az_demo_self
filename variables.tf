variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

variable "rg_name" {
  default = "demo-rg"
}

variable "location" {
  default = "East US"
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "demo-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
  default     = ["192.168.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
  default     = "demo-subnet"
}

variable "subnet_prefix" {
  description = "Subnet prefix"
  type        = string
  default     = "192.168.1.0/24"
}

