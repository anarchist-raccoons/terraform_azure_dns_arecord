provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"
  tenant_id = "${var.tenant_id}"
}

# Labels
module "labels" {
  source = "devops-workflow/label/local"
  version = "0.2.1"

  # Required
  environment = "${var.environment}"
  name = "${var.name}"
  # Optional
  namespace-org = "${var.namespace-org}"
  organization = "${var.org}"
  delimiter = "-"
  owner = "${var.owner}"
  team = "${var.team}"
  tags {
    Name = "${module.labels.id}"
  }
}

# Azure Public IP
resource "azurerm_public_ip" "default" {
  name = "${module.labels.id}"
  location = "${var.location}"
  resource_group_name = "${module.labels.id}"
  allocation_method   = "Static"

  tags = "${module.labels.tags}"
}

# Azure DNS A Record
resource "azurerm_dns_a_record" "default" {
  name = "${module.labels.id}"
  zone_name           = "${var.zone_name}"
  resource_group_name = "${var.zone_resource_group}"
  ttl                 = 300
  records             = ["${azurerm_public_ip.default.ip_address}"]
}