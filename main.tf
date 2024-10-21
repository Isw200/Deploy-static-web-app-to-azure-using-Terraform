terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}


provider "azurerm" {
  features {}

}

# create a resourse group
resource "azurerm_resource_group" "resourse_group" {
    name     = "rg-terraform-demo"
    location = "eastus"
}

# create a storage account
resource "azurerm_storage_account" "my_storage_account" {
    name                     = "saccterraformdemo"
    resource_group_name      = azurerm_resource_group.resourse_group.name
    location                 = azurerm_resource_group.resourse_group.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
    account_kind             = "StorageV2"

    static_website {
      index_document = "index.html"
    }
}

# create a blob container
resource "azurerm_storage_blob" "blob" {
    name                   = "index.html"
    storage_account_name   = azurerm_storage_account.my_storage_account.name
    storage_container_name = "$web"
    type                   = "Block"
    content_type           = "text/html"
    source_content         = "<html><body><h1>Hello, Terraform!</h1></body></html>"
}