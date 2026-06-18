locals {
  # Construct parent_id from env var + resource group name
  subscription_id = get_env("ARM_SUBSCRIPTION_ID", "")
  parent_id       = "/subscriptions/${local.subscription_id}/resourceGroups/${var.resource_group_name}"
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

# Fetch access keys via listKeys action
resource "azapi_resource_action" "db_keys" {
  type        = "Microsoft.Cache/redisEnterprise/databases@2025-07-01"
  resource_id = module.redis_enterprise.database_id
  action      = "listKeys"
}
