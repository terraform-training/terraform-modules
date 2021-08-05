variable "vpc_name" {
  type = string
  description = "The name of the VPC"
}

variable "auto_create_subnetworks" {
  type = bool
  description = "Enable or disable auto create of the subnetworks"
  default = false
}

variable "project" {
  type = string
  description = "The name of the project"
}
