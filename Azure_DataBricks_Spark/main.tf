resource "azurerm_resource_group" "DP-300_rg" {
    name = "${var.Resource_group}"
    location = "${var.location}"
    tags = "${var.Resource_group_tags}"
}

resource "azurerm_databricks_workspace" "example" {
    name  = "${var.azure_databricks_ws}"
    resource_group_name = "${var.Resource_group}"
    location = "${var.location}"
    sku = "Standard"

    tags = {
        environment = "Dev"

    }

}