provider "azurerm" {
  version = "~>2.0"
  features {}

  subscription_id = "07ee4d7d-00ae-4ebd-b4fd-ff11533f5667"
  client_id       = "22d685c5-4c9b-4a85-8140-015f55d55cea"
  client_secret   = "q_AJkEPcAuoq6KVVRO~rA45AmJe6Iq1rsP"
  tenant_id       = "4d387489-ee46-428c-a284-31fd15314024"
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
