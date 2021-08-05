resource "random_pet" "main" {
  length = var.length
}

output "codename" {
  value       = random_pet.main.id
  description = "Nazwa kodowa (wylosowana)"
}

variable "length" {
  type        = number
  description = "Długość (w wyrazach)"
  default     = 1
}