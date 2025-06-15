provider "azurerm" {
  features {}
  subscription_id = "c064671c-8f74-4fec-b088-b53c568245eb"
  resource_provider_registrations = "none"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "iac-vnet"
  location            = "westeurope"
  resource_group_name = "S1202816"

  address_space = [
    "10.0.0.0/16"
  ]
}

resource "azurerm_network_interface" "nic" {
  name                = "iac-nic"
  location            = "westeurope"
  resource_group_name = "S1202816"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/c064671c-8f74-4fec-b088-b53c568245eb/resourceGroups/S1202816/providers/Microsoft.Network/virtualNetwor>    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_public_ip" "pip" {
  name                = "iac-pip"
  location            = "westeurope"
  resource_group_name = "S1202816"
  allocation_method   = "Static"
  sku                 = "Basic"
}

resource "azurerm_linux_virtual_machine" "azure-vm" {
  name                  = var.vm_name
  location              = "westeurope"
  resource_group_name   = "S1202816"
network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = var.vm_size
  admin_username        = var.admin_username

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key_path)
  }

  os_disk {
    name              = "${var.vm_name}-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  disable_password_authentication = true
  computer_name                   = var.vm_name
}