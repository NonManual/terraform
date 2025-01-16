# Name of the resource group
resource_group_name = "example-resource-group"

# Name of the service principal
sp_name = "example-service-principal"

# Location of the resource group (default is "usgovvirginia", can override here if needed)
location = "usgovvirginia"

# Tags for the resource group
tags = {
  environment = "production"
  owner       = "admin@example.com"
}

# Subscription ID
subscription_id = "your-subscription-id"

# Tenant ID
tenant_id = "your-tenant-id"

# Remote state configuration
remote_state_resource_group_name   = "remote-state-rg"
remote_state_storage_account_name  = "remotestateaccount"
remote_state_container_name        = "tfstate-container"
