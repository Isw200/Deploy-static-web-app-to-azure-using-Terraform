variable "location" {
  type        = string
  description = "The region of the Azure resources."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the resources will be created."
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account."
}

variable "source_content" {
  type        = string
  description = "The content of the blob."
}

variable "index_document" {
  type        = string
  description = "The index document for the static website."
}