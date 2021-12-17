variable "subscription_id" {
    type = string
}

variable "rg_name" {
    type    = string
}

variable "location" {
    type     = string
    default = "eastus"
}

variable "vnet_name" {
    type     = string
}

variable "subnet_name" {
    type     = string
}

variable "virtual_machine_name" {
    type    = string
}

variable "public_ip_name" {
    type    = string
}

variable "network_interface_name" {
    type    = string
}

variable "ip_configuration_name" {
    type    = string
}

variable "OsDisk_name" {
    type    = string
}

variable "managed_disk_type" {
    type    = string
}

variable "vm_size" {
    type    = string
    default = "Standard_DS2_v2"

}

variable "admin_username" {
    type     = string
}

variable "admin_password" {
    type     = string
}

variable "address_space" {
    type     = list
}

variable "address_space_vnt" {
    type     = list
}