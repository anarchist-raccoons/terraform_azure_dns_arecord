variable "subscription_id" {
    description = "Azure subscription ID"
}
variable "client_id" {
  description = "Azure Client ID"
}

variable "client_secret" {
  description = "Azure Client Secret"
}
variable "tenant_id" {
    description = "Azure tenant ID."
}
variable "location" {
  description = "Location of the azure resource group. Default is London."
  default = "northeurope"
}
variable "zone_name" {
  description = "Zone Name"
}

variable "zone_resource_group" {
  description = "Zone Resource Group"
}