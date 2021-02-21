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

variable "resource_group_name" {
  type        = string
  description = "The resource group of Azure Firewall resource"
}

variable "resource_group_location" {
  type        = string
  description = "The location of the resource group"
}

variable "Resource_group_tags" {
  type   = map(string)
  default = {OWNER = "Anindita Basak", Origin = "az-database", ReasonCreated = "certification"}
  description = "The Azure Resource group tags"
}

variable "stream_analytics_job_name" {
  type = string
  description = "The Stream Analytics job name"
}

variable "azure_eventhub_namespace" {
    type = string
    description = "The Azure Event Hub namespace name"
  
}

variable "azure_eventhub_name" {
    type = string
    description = "The Azure Event Hub name"
  
}

variable "azure_eventhub_consumer_group_name" {
    type = string
    description = "The Azure eventhub consumer group"
  
}

variable "stream_analytics_input_name" {
    type = string
    description = "The Stream Analytics input job name"
  
}

variable "stream_analytics_output_job_name" {
    type = string
    description = "The Stream Analytics output job name"
  
}

variable "azure_storage_account_name" {
    type = string
    description = "The Azure storage account name"
  
}
variable "storage_container_name" {
  type = string
  description = "The Storage container name"
}