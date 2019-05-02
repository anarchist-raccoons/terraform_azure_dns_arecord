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

variable "zone_name" {
  description = "Zone Name"
}

variable "zone_resource_group" {
  description = "Zone Resource Group"
}

variable "record" {
  description = "List of IPv4 Addresses"
  default = ""
}