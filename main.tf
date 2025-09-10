resource "azurerm_resource_group" "rg" {
  name = "rg-test-terra"
  location = "East US"
}

resource "azurerm_storage_account" "adls" {
  name = "sapasa"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled = true #Hierachical namespace for ADLS Gen2
}