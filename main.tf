locals {
    default_subnets = [
    {
      network_private_subnet_network_region = "GRA9"
      network_private_subnet_cidr           = "10.0.1.0/24"
      network_private_subnet_start_ip       = "10.0.1.10"
      network_private_subnet_end_ip         = "10.0.1.200"
      network_private_subnet_dhcp_enabled   = true
      network_private_subnet_no_gateway     = false
    }
  ]

  effective_subnets = (
    length(var.network_private_subnets) > 0 ? var.network_private_subnets : local.default_subnets
  )
}

resource "ovh_cloud_project_network_private_subnet" "network_private_subnet" {
  for_each = {
    for i, subnet in local.effective_subnets :
    i => subnet
  }

  service_name = var.network_private_subnet_service_name
  network_id   = var.network_private_subnet_network_id

  region     = each.value.network_private_subnet_network_region
  network    = each.value.network_private_subnet_cidr
  start      = each.value.network_private_subnet_start_ip
  end        = each.value.network_private_subnet_end_ip
  dhcp       = each.value.network_private_subnet_dhcp_enabled
  no_gateway = each.value.network_private_subnet_no_gateway
}