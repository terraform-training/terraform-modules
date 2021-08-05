variable "projekt" {
  type        = string
  description = "Nazwa projektu GCP"
  #default     = "ncs-main"
}

variable "plik_credentials" {
  type        = string
  description = "Nazwa pliku z kluczami do GCP"
  default     = "account.json"
}

variable "region" {
  type        = string
  description = "Domyślny region GCP"
}
