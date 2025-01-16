provider "azurerm" {
  features {}
}

# Configure the Azure Active Directory (azuread) provider
provider "azuread" {
# Optional: Use client_id, client_secret, tenant_id if not using environment variables
# client_id       = var.client_id
# client_secret   = var.client_secret
# tenant_id       = var.tenant_id
# these ideally should be environment variables or Azure CLI authentication:
# AZURE_CLIENT_ID, AZURE_CLIENT_SECRET, AZURE_TENANT_ID
}


