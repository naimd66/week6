resource "azurerm_linux_virtual_machine" "azure-vm" {
  name                = "iac-vm-azure"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  admin_username      = "testuser"
  network_interface_ids = [azurerm_network_interface.nic.id]

  disable_password_authentication = true
  admin_ssh_key {
    username   = "testuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  custom_data = filebase64("cloud-init.yaml")
}