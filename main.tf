resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "adls" {
  name = "${var.adls_storage_account_name}${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled = true #Hierachical namespace for ADLS Gen2
}