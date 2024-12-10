variable "resource_group_name" {
  description = "The name of the existing resource group in which resources will be created."
  type        = string
  default     = "devops-dojo"
}

variable "location" {
  description = "The Azure location where resources will be provisioned."
  type        = string
  default     = "East US 2"
}

variable "admin_username" {
  description = "The admin username for the virtual machine."
  type        = string
  default     = "azureuser"
}

variable "ssh_key_path" {
  description = "The path to the SSH public key used to access the virtual machine."
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "domain_name" {
  description = "The name of the DNS zone to create for the virtual machine."
  type        = string
  default     = "utibeokon.me"
}

variable "hostnames" {
  description = "A list of hostnames to create in the DNS zone."
  type        = list(string)
  default     = ["@", "www", "traefik", "db"]
}