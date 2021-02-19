output "azurerm_resource_group" {
    value = azurerm_resource_group.example.Id
}

output "azurerm_storage_account" {
    value = azurerm_storage_account.example.Id
}

output "azurerm_eventhub_namespace" {
    value = azurerm_eventhub_namespace.example.Id
}

output "azurerm_eventhub_name" {
    value = azurerm_eventhub.example.Id
  
}

output "azurerm_iothub_id" {
    value = azurerm_iothub.example.Id
}