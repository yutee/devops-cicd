# output the public ip of the vm
output "vm_public_ip" {
  value = module.vm.public_ip
}

# output the dns zone name
output "dns_zone_name" {
  value = data.azurerm_dns_zone.domain.name
}

# output the inventory content
output "ansible_inventory" {
  value = <<EOT
[servers]
${module.vm.public_ip} ansible_user=${var.admin_username} ansible_ssh_private_key_file=~/.ssh/id_rsa
EOT
}