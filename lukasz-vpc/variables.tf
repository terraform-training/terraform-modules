variable "subnets" {
  type        = map(any)
  description = "Subnets to be created"
}

variable "name" {
  type        = string
  description = "VPC name"
}

variable "description" {
  type        = string
  description = "VPC description"
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "VPC subnets auto-create"
  default     = false
}

variable "routing_mode" {
  type        = string
  description = "VPC routing mode"
  default     = "GLOBAL"
}