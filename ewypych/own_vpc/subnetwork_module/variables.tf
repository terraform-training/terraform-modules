variable "subnetwork_name" {
  type = string
  description = "The name of the subnetwork"
}

variable "region" {
  type = string
  description = "The region of the subnetwork"
}

variable "vpc_network" {
  type = string
  description = "The VPC to connect with"
}

variable "ip_cidr" {
  type = string
  description = "The range of the IP subnetwork"
}
