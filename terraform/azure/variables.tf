variable "resource_group_name" { type = string }
variable "location"            { type = string, default = "westeurope" }
variable "ssh_public_key"     { type = string }
variable "esxi_host"          { type = string }
variable "esxi_user"          { type = string }
variable "esxi_password"      { type = string }
