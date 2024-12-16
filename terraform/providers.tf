
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraformstatesRG"
    storage_account_name = "terraformstate737"
    container_name       = "tfstateblob"
    key                  = "devops-dojo/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  # tenant_id       = var.tenant_id
  # subscription_id = var.subscription_id
  # client_id       = var.client_id
  # client_secret   = var.client_secret
}
