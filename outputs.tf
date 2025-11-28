output "subnet_id" {
  description = "ID du subnet privé OVH créé"
  value       = ovh_cloud_project_network_private_subnet.network_private_subnet.id
}

output "subnet_region" {
  description = "Région dans laquelle le subnet a été créé"
  value       = ovh_cloud_project_network_private_subnet.network_private_subnet.region
}

output "subnet_cidr" {
  description = "CIDR du subnet privé"
  value       = ovh_cloud_project_network_private_subnet.network_private_subnet.network
}

output "subnet_dhcp_enabled" {
  description = "Indique si DHCP est activé dans le subnet"
  value       = ovh_cloud_project_network_private_subnet.network_private_subnet.dhcp
}

output "subnet_no_gateway" {
  description = "Indique si le subnet est créé sans gateway"
  value       = ovh_cloud_project_network_private_subnet.network_private_subnet.no_gateway
}

output "subnet_ip_range" {
  description = "Plage IP du subnet (start → end)"
  value       = {
    start = ovh_cloud_project_network_private_subnet.network_private_subnet.start
    end   = ovh_cloud_project_network_private_subnet.network_private_subnet.end
  }
}
