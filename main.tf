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

resource "azurerm_virtual_network_gateway" "vng" {
  name = var.vng_name
  location            = data.azurerm_resource_group.vng_rg.location
  resource_group_name = data.azurerm_resource_group.vng_rg.name

  type = "Vpn"
  vpn_type = "RouteBased"

  active_active = true
  enable_bgp = true
  sku = "VpnGw2AZ"

  ip_configuration {
    name = "default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.vng_pip.id
    subnet_id = data.azurerm_subnet.gw_subnet.id
  }

  ip_configuration {
    name = "activeActive"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.vng_pip_ha.id
    subnet_id = data.azurerm_subnet.gw_subnet.id
  }
}


# resource "azurerm_local_network_gateway" "csr" {
#   name                = var.local_network_gateway_name
#   location            = data.azurerm_resource_group.vng_rg.location
#   resource_group_name = data.azurerm_resource_group.vng_rg.name

#   gateway_address     = "20.121.217.86"
#   address_space       = ["10.0.0.0/16"]
# }