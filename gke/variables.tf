variable "environment" {
  type        = string
  description = "Environment name"
}

variable "tags" {
  type        = list
  description = "Network tags list for bastion"
}

variable "network" {
  type        = string
  description = "VPC network name"
}

variable "subnetwork" {
  type        = string
  description = "VPC subnetwork to put bastion into"
}

variable "location" {
  type        = string
  description = "GKE resources location. Can be region or zone"
}

variable "gke_version" {
  type        = string
  description = "GKE version to use"
}

variable "min_gke_version" {
  type        = string
  description = "GKE major version"
}

variable "nodes_per_zone" {
  type        = string
  description = "What do you expect?"
}

variable "project_id" {
  type        = string
  description = "Project id"
}

variable "primary_nodepool_machine_type" {
  type    = string
  default = "n1-standard-2"
}

variable "primary_nodepool_disk_size" {
  type    = number
  default = 20
}

variable "primary_nodepool_disk_type" {
  type    = string
  default = "pd-ssd"
}

variable "primary_nodepool_min_size" {
  type    = number
  default = 1
}

variable "primary_nodepool_max_size" {
  type    = number
  default = 12
}

variable "primary_nodepool_auto_repair" {
  type    = string
  default = "false"
}

variable "primary_nodepool_auto_upgrade" {
  type    = string
  default = "false"
}

variable "namespaces" {
  type        = map
  description = "Map with namespaces names and annotations"
}
