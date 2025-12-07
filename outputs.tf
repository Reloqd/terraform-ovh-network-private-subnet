
output "service_name" {
  description = "OVH Cloud Project ID used"
  value       = ovh_cloud_project_network_private_subnet.this.service_name
}

output "subnet_id" {
  description = "ID of the private subnet"
  value = ovh_cloud_project_network_private_subnet.this.id
}

output "network_id" {
  description = "ID of the private network this subnet belongs to"
  value       = ovh_cloud_project_network_private_subnet.this.network_id
}

output "region" {
  description = "Region where the subnet is created"
  value       = ovh_cloud_project_network_private_subnet.this.region
}

output "cidr" {
  description = "CIDR block of the subnet"
  value       = ovh_cloud_project_network_private_subnet.this.cidr
}

output "gateway_ip" {
  description = "Gateway IP for this subnet"
  value       = ovh_cloud_project_network_private_subnet.this.gateway_ip
}

output "no_gateway" {
  description = "Whether the subnet was created without a default gateway"
  value       = ovh_cloud_project_network_private_subnet.this.no_gateway
}

output "start_ip" {
  description = "Start IP of the DHCP range"
  value       = ovh_cloud_project_network_private_subnet.this.start
}

output "end_ip" {
  description = "End IP of the DHCP range"
  value       = ovh_cloud_project_network_private_subnet.this.end
}

output "ip_pools" {
  description = "List of IP pools allocated in this subnet"
  value       = ovh_cloud_project_network_private_subnet.this.ip_pools
}
