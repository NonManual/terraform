variable "general_tags" {
  description = "A list of general tags to be used throughout the environment"
  type        = list(string)
  default     = ["govcloud", "dev", "vnet1"]
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string

  validation {
    condition     = length(var.resource_group_name) <= 64 && regex("^CAZ-[A-Z0-9]+-[A-Z]+-[A-Z]+-[A-Z0-9]+$", var.resource_group_name)
    error_message = "Resource group name must follow the convention 'CAZ-APPNAME-ENV-REGION-FUNCTION' and be 64 characters or less."
  }
}

variable "location" {
  description = "Azure region for resources"
  type        = string

  validation {
    condition     = contains(["usgovvirginia", "usgovarizona"], var.location)
    error_message = "Location must be 'usgovvirginia' or 'usgovarizona'."
  }
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string

  validation {
    condition     = length(var.vnet_name) <= 64 && regex("^CAZ-[A-Z0-9]+-[A-Z]+-[A-Z]+-VNET$", var.vnet_name)
    error_message = "Virtual network name must follow the convention 'CAZ-APPNAME-ENV-REGION-VNET' and be 64 characters or less."
  }
}

variable "vnet_tags" {
  description = "A list of tags to be used for the VNet"
  type        = list(string)

  validation {
    condition     = length(var.vnet_tags) > 0
    error_message = "The tags list for VNet must not be empty."
  }
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)

  validation {
    condition     = length(var.vnet_address_space) > 0
    error_message = "The address space for the VNet must not be empty."
  }
}

variable "aks_subnet_name" {
  description = "Name of the AKS subnet"
  type        = string

  validation {
    condition     = length(var.aks_subnet_name) <= 64 && regex("^CAZ-[A-Z0-9]+-[A-Z]+-[A-Z]+-SUBNET$", var.aks_subnet_name)
    error_message = "AKS subnet name must follow the convention 'CAZ-APPNAME-ENV-REGION-SUBNET' and be 64 characters or less."
  }
}

variable "aks_subnet_address_space" {
  description = "Address space for the AKS subnet"
  type        = list(string)

  validation {
    condition     = length(var.aks_subnet_address_space) > 0
    error_message = "The address space for the AKS subnet must not be empty."
  }
}

variable "virtual_node_subnet_name" {
  description = "Name of the virtual node subnet"
  type        = string

  validation {
    condition     = length(var.virtual_node_subnet_name) <= 64 && regex("^CAZ-[A-Z0-9]+-[A-Z]+-[A-Z]+-NODE$", var.virtual_node_subnet_name)
    error_message = "Virtual node subnet name must follow the convention 'CAZ-APPNAME-ENV-REGION-NODE' and be 64 characters or less."
  }
}

variable "virtual_node_subnet_address_space" {
  description = "Address space for the virtual node subnet"
  type        = list(string)

  validation {
    condition     = length(var.virtual_node_subnet_address_space) > 0
    error_message = "The address space for the virtual node subnet must not be empty."
  }
}

variable "lb_name" {
  description = "Name of the Load Balancer"
  type        = string

  validation {
    condition     = length(var.lb_name) <= 64 && regex("^CAZ-[A-Z0-9]+-[A-Z]+-[A-Z]+-LB$", var.lb_name)
    error_message = "Load Balancer name must follow the convention 'CAZ-APPNAME-ENV-REGION-LB' and be 64 characters or less."
  }
}

variable "probe_http_port" {
  description = "The port you are probing with LB probe"
  type        = number

  validation {
    condition     = var.probe_http_port > 0 && var.probe_http_port <= 65535
    error_message = "Probe HTTP port must be between 1 and 65535."
  }
}

variable "probe_http_protocol" {
  description = "The protocol you are probing"
  type        = string

  validation {
    condition     = contains(["Http", "Https"], var.probe_http_protocol)
    error_message = "Probe protocol must be either 'Http' or 'Https'."
  }
}

variable "probe_request_path" {
  description = "The request path of the LB probe"
  type        = string

  validation {
    condition     = regex("^/.*$", var.probe_request_path)
    error_message = "Probe request path must start with '/'."
  }
}

# Add similar validation for other variables like "sp_name", "public_ip_name", "nat_gateway_name", etc., based on the patterns shown in the screenshot.
