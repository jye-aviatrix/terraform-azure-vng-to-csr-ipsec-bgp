variable "vng_rg_name" {
  description = "VNG Resource Group Name"
}

variable "vng_name" {
  description = "VNG Name"
}

variable "vng_pip_az_zones" {
  description = "Provide list of availability zones for VNG Public IP"
  type        = list(any)
}
