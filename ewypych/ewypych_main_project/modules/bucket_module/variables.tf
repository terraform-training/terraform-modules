variable "name" {
  type        = string
  description = "The name of the GCP Bucket"
}

variable "location" {
  type        = string
  description = "The location od the Bucket"
}

variable "force_destroy" {
  type        = bool
  description = "To destroy or not to destroy"
  default     = true
}
