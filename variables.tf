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
    network_private_subnet_region     = string
    network_private_subnet_cidr       = string
    network_private_subnet_start_ip   = string
    network_private_subnet_end_ip     = string
    network_private_subnet_dhcp       = bool
    network_private_subnet_no_gateway = bool
  }))
  default = []

  validation {
    condition = alltrue([
      for s in var.network_private_subnets :
      can(cidrnetmask(s.network_private_subnet_cidr))
      &&
      can(ipaddress(s.network_private_subnet_start_ip))
      &&
      can(ipaddress(s.network_private_subnet_end_ip))
      &&
      contains([
        "GRA9",
        "SBG5",
        "DE1", "DE2",
        "UK1",
        "BHS5", "BHS7",
        "EU-WEST-PAR"
      ], s.network_private_subnet_region)
    ])

    error_message = "Chaque subnet doit contenir un CIDR valide, des adresses IP valides et une région OVH valide."
  }
}
