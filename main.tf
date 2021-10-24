resource "random_id" "uniq" {
  byte_length = 3
}

module "instance" {
  source = "github.com/vladvetu/terraform-ovirt_vm_instance?ref=v0.9.0"
  count = var.instances

  cluster_id        = local.cluster_id
  vm_template_id    = local.template_id
  vm_name           = "${var.instance_name}-0${count.index + 1}-${resource.random_id.uniq.hex}"
  vm_hostname       = "${var.instance_name}-0${count.index + 1}-${resource.random_id.uniq.hex}.${var.domain}"
  vm_os_type        = var.vm_os_type
  vm_dns_servers    = "192.168.2.1"
  vm_dns_search     = var.domain
  vm_memory         = "2048"
  vm_cpu_cores      = "2"
  vm_timezone       = "Europe/Bucharest"
  vm_nic_device     = var.nic_dev
  vm_nic_ip_address = module.ip[count.index].ip_address
  vm_nic_gateway    = cidrhost("${var.subnet_address}/${var.subnet_mask}", 1)
  vm_nic_netmask    = cidrnetmask("${var.subnet_address}/${var.subnet_mask}")
  vm_authorized_ssh_key = "${file(pathexpand("${var.authorized_ssh_key_path}"))}"
}

module "nic" {
  source = "github.com/vladvetu/terraform-ovirt_vm_nic?ref=v0.9.0"
  count = var.instances

  profile_name  = "ovirtmgmt"
  network_id = local.network_id
  vnic_name = var.nic_dev
  vm_id = module.instance[count.index].id
}

module "ip" {
  source = "github.com/vladvetu/terraform-phpipam_subnet_ip?ref=v0.9.1"
  count = var.instances

  subnet_address    = var.subnet_address
  subnet_mask       = var.subnet_mask
  hostname          = "${var.instance_name}-0${count.index + 1}-${resource.random_id.uniq.hex}.${var.domain}"
}

module "inventory" {
  source = "github.com/vladvetu/terraform-ansible_inventory?ref=v0.9.0"

  cluster_name    = var.instance_name
  cluster_random  = resource.random_id.uniq.hex
  vms_ip          = module.ip.*.ip_address
  vms_fqdn        = module.ip.*.hostname
}