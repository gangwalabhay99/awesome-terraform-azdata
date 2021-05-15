
provider "azurerm" {
  version = "~>2.0"
  features {}

  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"

}


resource "azurerm_resource_group" "DP-300_rg" {
    name = "${var.Resource_group}"
    location = "${var.location}"
    tags = "${var.Resource_group_tags}"
}

resource "azurerm_sql_server" "example" {
    name = "${var.azsqlserver_name}"
    resource_group_name = "${var.Resource_group}"
    location = "${var.azsqlserver-location}"
    version = "12.0"
    administrator_login = "${var.azsqlserver-login}"
    administrator_login_password = azurerm_key_vault_secret.example.value

    tags = {
        environment = "dev"
    }
}

resource "azurerm_sql_database" "example" {
    depends_on = [azurerm_sql_server.example]
    name = "${var.azsqlserverdb-name}"
    resource_group_name = "${var.Resource_group}"
    location = "${var.azsqlserver-location}"
    server_name = "${var.azsqlserver_name}"

    tags = {
        environment = "dev"
    }
    }

    resource "azurerm_storage_account" "example"{
        name = "${var.azstorageaccount-name}"
        resource_group_name = "${var.Resource_group}"
        location = "${var.azsqlserver-location}"
        account_tier = "${var.azstorage-accounttier}"
        account_replication_type = "LRS"

    }



