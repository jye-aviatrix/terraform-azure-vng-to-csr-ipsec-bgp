data "azurerm_resource_group" "vng_rg" {
  name = var.vng_rg_name
}

data "azurerm_virtual_network" "vng_vnet" {
  name = var.vng_vnet_name
  resource_group_name = var.vng_rg_name
}

data "http" "ip" {
  url = "https://ifconfig.me"
}