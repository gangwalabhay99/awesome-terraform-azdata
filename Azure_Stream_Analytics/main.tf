# Create Azure Resource Group

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



