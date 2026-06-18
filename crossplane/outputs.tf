output "resource_id" { value = module.redis_enterprise.resource_id }

output "name" { value = module.redis_enterprise.name }

output "hostname" { value = module.redis_enterprise.hostname }

output "port" { value = "10000" }

output "primary_access_key" {
  value     = azapi_resource_action.db_keys.output.primaryKey
  sensitive = true
}

output "secondary_access_key" {
  value     = azapi_resource_action.db_keys.output.secondaryKey
  sensitive = true
}
