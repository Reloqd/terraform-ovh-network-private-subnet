variable "subnet_service_name" {
  description = "OVH Cloud project ID (service_name)"
  type        = string
}

variable "subnet_network_id" {
  description = "ID du réseau privé OVH où créer le subnet"
  type        = string

  validation {
    condition     = length(var.subnet_network_id) > 0
    error_message = "The subnet_network_id must be a non-empty string."
  }
}

variable "subnet_region" {
  description = "Région du subnet privé OVH"
  type        = string

  validation {
    condition     = length(var.subnet_region) > 0
    error_message = "The subnet_region must be a non-empty string."
  }
}

variable "subnet_cidr" {
  description = "CIDR du subnet privé OVH"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.subnet_cidr))
    error_message = "The subnet_cidr must be a valid CIDR block."
  }
}

variable "subnet_start_ip" {
  description = "Adresse IP de début de la plage d'adresses du subnet privé OVH"
  type        = string

  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}$", var.subnet_start_ip))
    error_message = "The subnet_start_ip must be a valid IPv4 address."
  }
}

variable "subnet_end_ip" {
  description = "Adresse IP de fin de la plage d'adresses du subnet privé OVH"
  type        = string

  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}$", var.subnet_end_ip))
    error_message = "The subnet_end_ip must be a valid IPv4 address."
  }
}

variable "subnet_dhcp_enabled" {
  description = "Activer ou désactiver le DHCP pour le subnet privé OVH"
  type        = bool
  default     = true
}

variable "subnet_no_gateway" {
  description = "Activer ou désactiver la passerelle pour le subnet privé OVH"
  type        = bool
  default     = false
}
