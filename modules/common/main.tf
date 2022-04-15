resource "azurerm_recovery_services_vault" "assignment1-vault" {
  name                = var.recovery_service_vault_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Standard"
  soft_delete_enabled = false
  tags = var.tags
}


resource "azurerm_log_analytics_workspace" "assignment1-workspace" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags = var.tags
}


resource "azurerm_storage_account" "assignment1-sto-acc" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true
  tags = var.tags
}


