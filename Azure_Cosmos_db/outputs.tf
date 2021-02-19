output "azurerm_cosmos_db_account" {
    value = azurerm_cosmosdb_account.db.Id
}

output "azurerm_cosmos_db_database" {
    value = azurerm_cosmos_db_database.example.Id
}