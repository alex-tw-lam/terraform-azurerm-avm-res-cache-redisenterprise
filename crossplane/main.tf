locals {
  parent_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}"
}

module "redis_enterprise" {
  source = "github.com/alex-tw-lam/terraform-azurerm-avm-res-cache-redisenterprise.git"

  parent_id             = local.parent_id
  location              = var.location
  name                  = var.name
  sku_name              = var.sku_name
  enable_telemetry      = false
  public_network_access = "Enabled" # default is "Disabled"
}

# Note: Access keys can be fetched via Azure CLI when needed:
#   az redis enterprise database list-keys \
#     --resource-group <rg> --cluster-name <name> --database-name default
