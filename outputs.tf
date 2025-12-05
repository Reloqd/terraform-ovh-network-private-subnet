###############################################
# Subnet IDs per region
###############################################
output "subnet_ids" {
  description = "Map of region → subnet ID"
  value = {
    for region, subnet in ovh_cloud_project_network_private_subnet.network_private_subnet :
    region => subnet.id
  }
}

###############################################
# Subnet regions
###############################################
output "subnet_regions" {
  description = "List of regions where subnets were created"
  value       = keys(ovh_cloud_project_network_private_subnet.network_private_subnet)
}

###############################################
# CIDR per region
###############################################
output "subnet_cidrs" {
  value = {
    for region, subnet in ovh_cloud_project_network_private_subnet.network_private_subnet :
    region => subnet.network
  }
}

###############################################
# IP ranges (start/end)
###############################################
output "subnet_ip_ranges" {
  value = {
    for region, subnet in ovh_cloud_project_network_private_subnet.network_private_subnet :
    region => {
      start = subnet.start
      end   = subnet.end
    }
  }
}
