resource "azurerm_public_ip" "vng_pip" {
  name                = "${var.vng_name}-pip"
  location            = data.azurerm_resource_group.vng_rg.location
  resource_group_name = data.azurerm_resource_group.vng_rg.name

  allocation_method = "Static"
  sku = "Standard"
  zones = var.vng_pip_az_zones
}

resource "azurerm_public_ip" "vng_pip_ha" {
  name                = "${var.vng_name}-pip-ha"
  location            = data.azurerm_resource_group.vng_rg.location
  resource_group_name = data.azurerm_resource_group.vng_rg.name

  allocation_method = "Static"
  sku = "Standard"
  zones = var.vng_pip_az_zones
}