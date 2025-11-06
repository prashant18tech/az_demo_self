variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region name for the resource group"
  type        = string
  default     = "East US"
}
