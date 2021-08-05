variable "environment" {
  type        = string
  description = "Environment name"
}

variable "tags" {
  type        = list(any)
  description = "Network tags list for bastion"
}

variable "user" {
  type        = string
  description = "Username to login to bastion"
  default     = "bastion"
}

variable "network" {
  type        = string
  description = "VPC network name"
}

variable "subnetwork" {
  type        = string
  description = "VPC subnetwork to put bastion into"
}

variable "machine_type" {
  type        = string
  description = "Bastion machine type"
}

variable "image" {
  type        = string
  description = "Bastion image"
  default     = "debian-cloud/debian-10"
}