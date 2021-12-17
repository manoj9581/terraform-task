provider "azurerm" {
subscription_id = var.subscription_id
   features {}
}

# Use existing resource group

    data "azurerm_resource_group" "rg" {
    name     = var.rg_name
}

resource "azurerm_virtual_network" "main" {

  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = var.address_space_vnt
  location            = var.location

}

resource "azurerm_subnet" "internal" {

  name                 = var.subnet_name
  resource_group_name = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.address_space

}

resource "azurerm_network_interface" "main" {

  name                = var.network_interface_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }

}


resource "azurerm_virtual_machine" "myvm" {

    name                  = var.virtual_machine_name

    location              = var.location

    resource_group_name   = data.azurerm_resource_group.rg.name

    network_interface_ids = [azurerm_network_interface.main.id]

    vm_size               = var.vm_size

 

    storage_os_disk {

        name              = var.OsDisk_name

        caching           = "ReadWrite"

        create_option     = "FromImage"

        managed_disk_type = var.managed_disk_type

    }

    storage_image_reference {

        publisher = "Canonical"

        offer     = "UbuntuServer"

        sku       = "18.04-LTS"

        version   = "latest"

    }         

   os_profile {

        computer_name  = var.virtual_machine_name

                             admin_username = var.admin_username

        admin_password = var.admin_password

 

    }

              os_profile_linux_config {

    disable_password_authentication = false

  }

}