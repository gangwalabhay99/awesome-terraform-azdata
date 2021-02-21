# Create Azure Blob storage 

resource "azurerm_storage_account" "example" {
    name  = "${var.azure_storage_account_name}"
    resource_group_name = azurerm_resource_group.example.name
    location = azurerm_resource_group.example.location
    account_tier = "Standard"
    account_replication_type = "LRS"
  
}

resource "azurerm_storage_container" "example" {
    name = "${var.storage_container_name}"
    storage_account_name = azurerm_storage_account.example.name
    container_access_type = "private"
  
}

