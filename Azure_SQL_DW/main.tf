resource "azurerm_resource_group" "DP-300_rg" {
    name = "${var.Resource_group}"
    location = "${var.location}"
    tags = "${var.Resource_group_tags}"
}

resource "azurerm_sql_server" "example" {
    depends_on = ["azurerm_resource_group.DP-300_rg"]
    name = "${var.azsqlserver_name}"
    resource_group_name = "${var.Resource_group}"
    location = "${var.azsqlserver-location}"
    version = "12.0"
    administrator_login = "${var.azsqlserver-login}"
    administrator_login_password = "${var.azsqlserver-login-password}"

    tags = {
        environment = "dev"
    }
}

resource "azurerm_sql_database" "example" {
    depends_on = [azurerm_sql_server.example]
    name = "${var.azsqlserverdb-name}"
    resource_group_name = "${var.Resource_group}"
    location = "${var.azsqlserver-location}"
    edition = "${var.azurerm_sql_database_edition}"
    server_name = "${var.azsqlserver_name}"
    
    
    tags = {
        environment = "dev"
    }
    }
