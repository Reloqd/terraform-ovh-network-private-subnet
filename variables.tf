variable "network_private_subnet_service_name" {
  description = "OVH Cloud project ID (service_name)"
  type        = string
}

variable "network_private_subnet_network_id" {
  description = "ID du réseau privé OVH où créer le subnet"
  type        = string
}

variable "network_private_subnets" {
  description = "List of subnets"
  type = list(object({
    network_private_subnet_network_region = string
    network_private_subnet_cidr           = string
    network_private_subnet_start_ip       = string
    network_private_subnet_end_ip         = string
    network_private_subnet_dhcp_enabled   = bool
    network_private_subnet_no_gateway     = bool
  }))
  default = []
}
