variable "name" {
  type        = string
  description = "VPN name"
}

variable "description" {
  type        = string
  description = "VPC description"
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "Subnets auto-create"
  default     = false
}

variable "routing_mode" {
  type        = string
  description = "Routing mode"
  default     = "REGIONAL"
}