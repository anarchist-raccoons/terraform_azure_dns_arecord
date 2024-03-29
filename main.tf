provider "azurerm" {
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
  features {}
}

# Labels
module "labels" {
   source = "github.com/netflash/terraform-local-label"
#  source = "devops-workflow/label/local"
#  version = "0.2.1"

  # Required
  environment = var.environment
  name = var.name
  # Optional
  namespace-org = var.namespace-org
  organization = var.org
  delimiter = "-"
  owner = var.owner
  team = var.team
  tags = {
    Name = module.labels.id
  }
}

# Azure DNS A Record
resource "azurerm_dns_a_record" "default" {
#  name = "${module.labels.name}-${module.labels.environment}"
  name = format("%s-%s", module.labels.name,module.labels.environment)
  zone_name           = var.zone_name
  resource_group_name = var.zone_resource_group
  ttl                 = 300
  records             = [var.record]
}
