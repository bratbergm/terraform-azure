resource "azurerm_resource_group" "resource_group1" {
  name      = "resource_group1"
  location  = var.resource_group_location
}


module "vnet" {
  source                = "./modules/1-vnet"
  resource_group_name   = azurerm_resource_group.resource_group1.name
}

module "vms" {
  source                = "./modules/2-vms"
  resource_group_name   = azurerm_resource_group.resource_group1.name
}

module "sql" {
  source                = "./modules/3-sql"
  resource_group_name   = azurerm_resource_group.resource_group1.name
}
