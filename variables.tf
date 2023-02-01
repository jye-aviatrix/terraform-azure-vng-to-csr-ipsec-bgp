variable "vng_rg_name" {
  description = "VNG Resource Group Name"
}

variable "vng_name" {
  description = "VNG Name"
}

variable "vng_vnet_name" {
  description = "Virtual Network name for the VNG to be deployed to (must have /27 GatewaySubnet )"
}

variable "vng_vnet_rg_name" {
  description = "Virtual Network Resource Group name for the VNG to be deployed to"
}

variable "vng_pip_az_zones" {
  description = "Provide list of availability zones for VNG Public IP"
  type        = list(any)
}

variable "local_network_gateway_name" {
  description = "Provide Loca Network Gateway Name"
  default = "csr"
}

variable "csr_rg_name" {
  description = "Provide CSR resource group name"
  default = "csr"
}

variable "csr_rg_location" {
    description = "Provide location of CSR resource group"
    default = "East US"  
}

variable "csr_pip_name" {
    description = "Provide CSR Public IP Name"
    default = "csr-ip"  
}
