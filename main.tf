resource "ovh_cloud_project_network_private_subnet" "this" {
  service_name = var.subnet_service_name
  network_id   = var.subnet_network_id
  region       = var.subnet_region
  network      = var.subnet_cidr
  start        = var.subnet_start_ip
  end          = var.subnet_end_ip
  dhcp         = var.subnet_dhcp_enabled
  no_gateway   = var.subnet_no_gateway
}