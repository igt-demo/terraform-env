resource "azurerm_resource_group" "this" {
  name     = "${var.environment}-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "this" {
  name                = "${var.environment}-network"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_subnet" "this" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.10.2.0/24"]
}
