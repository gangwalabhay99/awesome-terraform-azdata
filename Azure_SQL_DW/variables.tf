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

variable "azsqlserver_name" {
    type    = string
    description = "The Azure SQL Server Name"
}

variable "azsqlserver-location" {
    type  = string
    description = "The Azure SQL Server location"
}

variable "azsqlserver-login" {
    type  = string
    description = "The Azure SQL Server login name"
}

variable "azsqlserver-login-password" {
    type  = string
    description = "The Azure SQL Server login password"
}

variable "azsqlserverdb-name" {
    type = string
    description = "The Azure SQL Server db name"
}

variable "azurerm_sql_database_edition" {
    type  = string
    description = "The Azure SQL database edition"

}
