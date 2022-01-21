
## Resource Group
variable "resource_group_name" {
  type        = string
  default     = "resource_group1"
}

variable "location" {
  type        = string
  default     = "norwayeast"
}

## Virtual Network
variable "vnet_name" {
  type        = string
  default     = "first_vnet"
}

variable "address_space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefixes" {
  type        = string
  default     = "10.0.1.0/24"
  description = "description"
}

variable "subnet_name" {
  type        = string
  default     = "first_subnet"
  description = "description"
}

## SQL
variable "sql_server_name" {
  type        = string
  default     = "sql-server-1"
}

variable "sql_server_version" {
  type        = string
  default     = "12.0"
}

variable "sql_database_name" {
  type        = string
  default     = "sql-db-1"
}

variable "sql_database_edition" {
  type        = string
  default     = "Basic"
}

## VM
variable "vm_name" {
  type        = string
  default     = "win-vm-1"
}

variable "vm_size" {
  type        = string
  default     = "Standard_F2"
}

variable "" {
  type        = string
  default     = ""
}


