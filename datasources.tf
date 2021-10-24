data "ovirt_datacenters" "d" {
  # name_regex = "^area54*"

  search = {
    criteria       = "name = ${var.dc_name} and status = up"
    max            = 1
    case_sensitive = false
  }
}

data "ovirt_clusters" "c" {
  # name_regex = "^default*"

  search = {
    criteria       = "name = ${var.cl_name} and Storage.name = ${var.storagedomain_name}"
    max            = 1
    case_sensitive = false
  }
}

data "ovirt_templates" "t" {
  search = {
    criteria       = "name = ${var.tpl_name}"
    max            = 1
    case_sensitive = false
  }
  latest = true
}

data "ovirt_networks" "n" {
  # name_regex = "^ovirtmgmt-t*"

  search = {
    criteria       = "datacenter = ${var.dc_name} and name = ${var.network_name}"
    max            = 1
    case_sensitive = false
  }
}

locals {
  cluster_id  = data.ovirt_clusters.c.clusters.0.id
  template_id = data.ovirt_templates.t.templates.0.id
  network_id  = data.ovirt_networks.n.networks.0.id
}
