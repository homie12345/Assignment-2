terraform {

  backend "azurerm" {
    resource_group_name  = "tfstateN01517077RG"
    storage_account_name = "tfstaten01517077sa"
    container_name       = "tfstatefiles"
    key                  = "tfstatefile"
  }
}
