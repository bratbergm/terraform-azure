
# Resource Group
resource "azurerm_resource_group" "resource_group1" {
  name      = var.resource_group_name
  location  = var.location
}


resource "azurerm_virtual_network" "vnet" {
    resource_group_name = var.resource_group_name
    location            = var.location
    name                = var.vnet_name
    address_space       = var.address_space
}

resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name # / azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_prefixes
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_sql_server" "sqlserver1" {
  name                 = var.sql_server_name
  resource_group_name  = var.resource_group_name # Or: azurerm_resource_group.resource_group1.name
  location             = var.location
  version              = var.sql_server_version
  administrator_login  = ""
  administrator_login_password = ""

  depends_on = [azurerm_resource_group.resource_group1]
}

resource "azurerm_sql_database" "sqldatabase1" {
  name                 = var.sql_database_name
  resource_group_name  = var.sql_database_name
  location             = var.location
  server_name          = azurerm_sql_server.sqlserver1.name
  edition              = var.sql_database_edition
}


resource "azurerm_windows_virtual_machine" "win-vm-1" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.resource_group1.name
  location            = azurerm_resource_group.resource_group1.location
  size                = var.vm_size
  admin_username      = "admin"
  admin_password      = ""
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}