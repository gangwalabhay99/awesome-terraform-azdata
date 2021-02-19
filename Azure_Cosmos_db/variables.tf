variable "subscription_id" {
  type        = string
  description = "The Subscription Id for Azure account"
}

variable "client_id" {
  type        = string
  description = "The Client Id of the service principal"
}

variable "client_secret" {
  type        = string
  description = "The client secret of the service pricipal"
}

variable "tenant_id" {
  type        = string
  description = "the tenant Id of the directory"
}

variable "Resource_group" {
  type        = string
  description = "The resource group of Azure Firewall resource"
}

variable "location" {
  type        = string
  description = "The location of the resource group"
}

variable "Resource_group_tags" {
  type   = map(string)
  default = {OWNER = "Anindita Basak", Origin = "az-database", ReasonCreated = "certification"}
  description = "The Azure Resource group tags"
}

variable "cosmosdb-account_name" {
    type = string
    description = "The Cosmos db account name"
}

variable "failover_location" {
    type = string
    description = "The Failover location of Azure Cosmos db account"
}

variable "azurerm_cosmosdb_sql_db_name" {
    type = string
    description = "The Azure Cosmos sql db name"
}

variable "cosmos_db_throughput"{
    type = string
    description = "The Azure Cosmos db throughput"
}