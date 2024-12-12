# provision a virtual network from the network module
module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = "server-vnet"
  subnet_name         = "server-subnet"
  nsg_name            = "server-nsg"
  allowed_ports       = ["22", "80", "443"]
}

# provision a virtual machine instance from vm module
module "vm" {
  source              = "./modules/vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  vm_name             = "server"
  vm_size             = "Standard_B2s"
  admin_username      = var.admin_username
  ssh_public_key      = var.ssh_key_path
  subnet_id           = module.network.subnet_id
}

# dns record for the server
# dns zone (slready created manually)
data "azurerm_dns_zone" "domain" {
  name                = var.domain_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_dns_a_record" "host_records" {
  count = length(var.hostnames)

  name                = count.index == 0 ? "@" : element(var.hostnames, count.index)
  zone_name           = data.azurerm_dns_zone.domain.name
  resource_group_name = var.resource_group_name
  ttl                 = 3600
  records             = [module.vm.public_ip]
}