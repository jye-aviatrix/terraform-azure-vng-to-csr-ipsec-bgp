resource "azurerm_resource_group" "csr_rg" {
  name = var.csr_rg_name
  location = var.csr_rg_location
}

resource "azurerm_public_ip" "csr_pip" {
  name                = var.csr_pip_name
  location            = azurerm_resource_group.csr_rg.location
  resource_group_name = azurerm_resource_group.csr_rg.name

  allocation_method = "Static"
  sku = "Standard"
}