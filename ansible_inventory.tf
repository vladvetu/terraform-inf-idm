# resource "local_file" "ansible_inventory" {
#   count = var.ansible_inventory_enabled ? 1 : 0

#   content = templatefile("${path.module}/templates/hosts.yml.tpl",
#   {
#       uniq = random_id.uniq.hex
#       instance_name = var.instance_name
#       instance_prefix = var.instance_prefix
#       domain = var.domain
#       instances  = libvirt_domain.vm_domain.*
#       instances_ips = libvirt_domain.vm_domain[*].network_interface[0].addresses[0]
#   }
#   )
#   filename = "${var.ansible_inventory_path}/${var.instance_prefix}${var.instance_name}-${random_id.uniq.hex}.yml"
# }