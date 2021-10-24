output cluster_info {
  value       = data.ovirt_clusters.c.clusters.0
  sensitive   = false
  description = "description"
  # depends_on  = []
}


# output subnet {
#   value       = module.ip.*.subnet
#   description = "Subnet"
# }


# output gateway_id {
#   value       = module.ip.*.subnet.gateway_id
#   description = "Subnet Gateway"
# }
