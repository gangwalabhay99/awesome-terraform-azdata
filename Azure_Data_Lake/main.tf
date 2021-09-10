provider "azurerm" {
  version = "~>2.0"
  features {}

  subscription_id = "var.subscription_id"
  client_id       = "var.client_id"
  client_secret   = "var.client_secret"
  tenant_id       = "var.tenant_id"
}


resource "azurerm_resource_group" "examplerg" {
  name     = "terraform_resources"
  location = "North Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestoreani"
  resource_group_name      = azurerm_resource_group.examplerg.name
  location                 = azurerm_resource_group.examplerg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "example" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "example" {
  name                   = "terraform.pdf"
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block"
  #  source                      = "localfile.pdf"
  access_tier = "Hot"
}

resource "azurerm_data_lake_store" "example_store" {
  name                = "consumptiondatalake"
  resource_group_name = azurerm_resource_group.examplerg.name
  location            = azurerm_resource_group.examplerg.location
}
