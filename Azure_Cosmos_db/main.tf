resource "azurerm_resource_group" "DP-300_rg" {
    name = "${var.Resource_group}"
    location = "${var.location}"
    tags = "${var.Resource_group_tags}"
}

resource "random_integer" "ri" {
    min = 10000
    max = 99999
}

resource "azurerm_cosmosdb_account" "db" {
    name  = "${var.cosmosdb-account_name}-${random_integer.ri.result}"
    location = "${var.location}"
    resource_group_name = "${var.Resource_group}"
    offer_type = "Standard"
    kind   = "GlobalDocumentDB"

    enable_automatic_failover = true

    capabilities {
        name = "EnableAggregationPipeline"
    }
    capabilities {
        name = "MongoEnableDocLevelTTL"
    }

    capabilities {
        name = "MongoDBv3.4"
    }

    consistency_policy {
        consistency_level = "Session" 
        max_interval_in_seconds = 10
        max_staleness_prefix = 200
    }

    geo_location {
        location = "${var.failover_location}"
        failover_priority = 1
    }

    geo_location {
        location = "${var.location}"
        failover_priority = 0
    }
}

resource "azurerm_cosmosdb_sql_database" "example" {
    name  = "${var.azurerm_cosmosdb_sql_db_name}"
    location = "${var.location}"
    resource_group_name = "${var.Resource_group}"
    account_name = azurerm_cosmosdb_account.db.name
    throughput = "${var.cosmos_db_throughput}"
}

