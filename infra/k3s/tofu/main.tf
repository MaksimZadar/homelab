terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc8"
    }
  }
  backend "azurerm" {
    resource_group_name  = var.az_resource_group_name
    storage_account_name = var.az_storage_account_name
    container_name       = var.az_container_name
    key                  = var.az_tfstate_key
  }
}

provider "proxmox" {
  pm_api_url = var.pm_api_url
  pm_api_token_id = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure = var.pm_tls_insecure
}
