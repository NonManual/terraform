data "terraform_remote_state" "iam" {
  backend = "azurerm"

  config = {
    resource_group_name   = var.remote_state_resource_group_name
    storage_account_name  = var.remote_state_storage_account_name
    container_name        = var.remote_state_container_name
    key                    = "iam/terraform.tfstate"
  }
}
