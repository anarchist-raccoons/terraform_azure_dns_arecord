provider "azurerm" {
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
  features {}
}

# Labels
module "labels" {
#  source = "devops-workflow/label/local"
#  version = "0.2.1"

  # possible alternative to work with > 0.11
  source = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.12.2"
  environment = var.environment
  name       = var.name
  namespace  = var.namespace-org
  delimiter  = "-"

  tags = { Name = module.labels.id }
#  # Required
#  environment = var.environment
#  name = var.name
#  # Optional
#  namespace-org = var.namespace-org
#  organization = var.org
#  delimiter = "-"
#  owner = var.owner
#  team = var.team
#  tags {
#    Name = module.labels.id
#  }
}

# Azure DNS A Record
resource "azurerm_dns_a_record" "default" {
  name = join("-", [module.labels.name, module.labels.environment])
  zone_name           = var.zone_name
  resource_group_name = var.zone_resource_group
  ttl                 = 300
  records             = [var.record]
}
