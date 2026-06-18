output "resource_id" { value = module.redis_enterprise.resource_id }

output "name" { value = module.redis_enterprise.name }

output "hostname" { value = module.redis_enterprise.hostname }

output "port" { value = "10000" }

# Access keys are not directly accessible via azapi outputs due to sensitive_output
# limitations. Keys can be fetched via: az redis enterprise database list-keys
