variable "environment" {
  type        = string
  description = "(optional) describe your variable"
}

variable "cidr_config" {
  type        = map(any)
  description = "Cidr config for VPC. See README.md for expected structure"
}
