resource "azurerm_resource_group" "example" {
    name = "${var.Resource_group}"
    location = "${var.location}"
}

resource "azurerm_storage_account" "example" {
    name  = "${var.storage_account_name}"
    resource_group_name = "${var.Resource.group}"
    location = "${var.location}"
    account_tier = "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
    name  = "${var.storage_container_name}"
    storage_account_name = azurerm_storage_account.example.name
    container_access_type = "${var.container_access_type}"
}

resource "azurerm_eventhub_namespace" "example" {
    name  = "${var.azurerm_eventhub_ns_name}"
    resource_group_name = azurerm_resource_group.example.name
    location = azurerm_resource_group.example.location
    sku = "{var.azurerm_eventhub_sku}"
}

resource "azurerm_eventhub" "example" {
    name  = "{var.azurerm_eventhub_name}"
    resource_group_name = azurerm_resource_group.example.name
    partition_count = 2
    message_retention = 1
}

resource "azurerm_eventhub_authorization_rule" "example" {
    resource_group_name = azurerm_resource_group.example.name
    namespace_name = azurerm_eventhub_namespace.example.name
    eventhub_name = azurerm_eventhub.example.name
    name  = "${var.azurerm_eh_authorization_rulename}"
    send  = true
}

resource "azurerm_iothub" "example" {
    name  = "${var.azurerm_iothub_name}"
    resource_group_name = azurerm_resource_group.example.name
    location = azurerm_resource_group.location

    sku {
        name = "S1"
        capacity = "1"
    }

    endpoint {
      batch_frequency_in_seconds = 60
      connection_string = azurerm_storage_account.example.primary_blob_connection_string
      container_name = azurerm_storage_container.example.name
      encoding = "Avro"
      file_name_format = "{iothub}/{partition}_{YYYY}_{MM}_{DD}_{HH}_{mm}"
      max_chunk_size_in_bytes = 1
      name = "export"
      resource_group_name = azurerm_resource_group.example.name
      type = "AzureIoTHub.StorageContainer"
    } 

    endpoint  {
      type  = "AzureIotHub.EventHub"
      connection_string = azurerm_eventhub_authorization_rule.example.primary_blob_connection_string
      name  = "export2"
    } 

    route {
        name  = "export"
        source = "DeviceMessages"
        condition = "true"
        endpoint_names = ["export"]
        enabled  = true
    }

    route {
        name  = "export2"
        source = "DeviceMessages"
        condition = "true"
        endpoint_names = ["export2"]
        enabled   =  true
                
    }

    enrichment  {
      endpoint_names = [ "tenant" ]
      key = "$twin.tags.Tenant"
      value = ["export", "export2"]
    } 
tags  = {
    purpose = "dev"
}


}