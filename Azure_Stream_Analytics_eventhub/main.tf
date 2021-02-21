resource "azurerm_resource_group" "example" {
    name = "${var.resource_group_name}"
    location = "${var.resource_group_location}"
    
}

resource "azurerm_stream_analytics_job" "example"{
    name = "${var.stream_analytics_job_name}"
    resource_group_name = azurerm_resource_group.example.name
    location = azurerm_resource_group.example.location
    compatibility_level = "1.1"
    data_locale = "en-GB"
    events_late_arrival_max_delay_in_seconds = 60
    events_late_of_order_max_delay_in_seconds = 50
    events_out_of_order_policy = "Adjust"
    output_error_policy = "Drop"
    streaming_units = 3

    tags = {
        environment = "Dev"
    }
}

resource "azurerm_eventhub_namespace" "example" {
    name = "${var.azure_eventhub_namespace}"
    location = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    sku = "Standard"
    capacity = 1
  
}

resource "azurerm_eventhub" "example" {
    name  = "${var.azure_eventhub_name}"
    namespace_name = azurerm_eventhub_namespace.example.name
    resource_group_name = azurerm_resource_group.example.name
    partition_count = 2
    message_retention = 1
 
}

# Event hub consumer group

resource  "azurerm_eventhub_consumer_group" "example" {
    name  = "${var.azure_eventhub_consumer_group_name}"
    namespace_name = azurerm_eventhub_namespace.example.name
    eventhub_name = azurerm_eventhub.example.name
    resource_group_name = azurerm_resource_group.example.name

}

resource "azurerm_stream_analytics_stream_input_eventhub" "example" {
    name  = "${var.stream_analytics_input_name}"
    stream_analytics_job_name = azurerm_stream_analytics_job.example.name
     resource_group_name = azurerm_resource_group.example.name
     eventhub_consumer_group_name = azurerm_eventhub_consumer_group.example.name
     eventhub_name = azurerm_eventhub.example.name
     servicebus_namespace = azurerm_eventhub_namespace.example.name
     shared_access_policy_key = azurerm_eventhub_namespace.example.default_primary_key
     shared_access_policy_name = "RootManageSharedAccessKey"

     serialization {
       type = "Json"
       encoding = "UTF8"
     }

     resource "azurerm_stream_analytics_output_blob" "example" {
         name  = "${var.stream_analytics_output_job_name}"
         stream_analytics_job_name = azurerm_stream_analytics_job.example.name
         resource_group_name = azurerm_resource_group.example.name
         storage_account_name = azurerm_storage_account.example.name
         storage_account_key = azurerm_storage_account.example.default_primary_key
         storage_container_name = azurerm_storage_container.example.name
         path_pattern = "pattern_name"
         date_format = "yyyy-MM-dd"
         time_format = "HH"

         serialization {
             type = "Json"
             encoding = "UTF8"
         }
     }
}