data "azurerm_resource_group" "vng_rg" {
  name = var.vng_rg_name
}


data "azurerm_subnet" "gw_subnet" {
  name                 = "GatewaySubnet"
  virtual_network_name = var.vng_vnet_name
  resource_group_name  = var.vng_vnet_rg_name
}