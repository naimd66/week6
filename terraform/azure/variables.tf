variable "location" {
  type    = string
  default = "westeurope"
}

variable "resource_group_name" {
  type    = string
  default = "iac-rg"
}

variable "vm_name" {
  type    = string
  default = "iac-vm"
}

variable "admin_username" {
  type    = string
  default = "testuser"
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}