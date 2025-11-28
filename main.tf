
locals {
  network_private_subnet_list = [
    {
      network_private_subnet_region     = "GRA9"
      network_private_subnet_cidr       = "10.0.1.0/24"
      network_private_subnet_start_ip   = "10.0.1.10"
      network_private_subnet_end_ip     = "10.0.1.200"
      network_private_subnet_dhcp       = true
      network_private_subnet_no_gateway = false
    },
    {
      network_private_subnet_region     = "SBG5"
      network_private_subnet_cidr       = "10.0.2.0/24"
      network_private_subnet_start_ip   = "10.0.2.10"
      network_private_subnet_end_ip     = "10.0.2.200"
      network_private_subnet_dhcp       = true
      network_private_subnet_no_gateway = false
    }    
  ]
}
resource "ovh_cloud_project_network_private_subnet" "network_private_subnet" {
    for_each = length(var.network_private_subnets) == 0 ? {
    for i, subnet in locals.network_private_subnet_list :
    i => subnet
  } : {
    for i, subnet in var.network_private_subnets :
    i => subnet
  }
  
  service_name = var.network_private_subnet_service_name
  network_id   = var.network_private_subnet_network_id

  region       = each.value.network_private_subnet_network_region
  start        = each.value.network_private_subnet_start_ip
  end          = each.value.network_private_subnet_end_ip
  network      = each.value.network_private_subnet_cidr
  dhcp         = each.value.network_private_subnet_dhcp_enabled
  no_gateway   = each.value.network_private_subnet_no_gateway
}