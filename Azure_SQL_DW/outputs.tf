output "azurerm_sql_server_name" {
    value = azurerm_sql_server.example.name
}

output "azurerm_sql_server_resource_group" {
    value = azurerm_sql_server.example.resource_group_name
}

output "azurerm_sql_database_name" {
    value = azurerm_sql_database.example.name
}

output "azurerm_sql_database_resource_group" {
    value = azurerm_sql_database.example.resource_group_name
}