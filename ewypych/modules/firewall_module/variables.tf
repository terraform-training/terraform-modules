variable "rule_name" {
  type = string
  description = "The name of the firewall rule"
}

variable "vpc_name" {
  type = string
  description = "The name of the VPC"
}

variable "port_incoming" {
  type = number
  description = "The port to open"
}

variable "source_range" {
  type = string
  description = "The IP range that traffic from should be allowed."
}

variable "network_tag" {
  type = string
  description = "The network tag to associate"
}
