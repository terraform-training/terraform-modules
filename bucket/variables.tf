variable "name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "location" {
  type        = string
  default     = "EU"
  description = "Location of the bucket (may be multiregional)"
}

variable "force_destroy" {
  type        = bool
  default     = true
  description = "Force destroy"
}

variable "versioning" {
  type        = bool
  description = "(optional) describe your variable"
  default     = false
}