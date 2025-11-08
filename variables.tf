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
