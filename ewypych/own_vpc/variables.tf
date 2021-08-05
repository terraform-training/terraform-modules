variable "project_name" {
  type        = string
  description = "The name of the GCP Project"
}

variable "region" {
  type        = string
  description = "The name of the region"
}

variable "credential_file" {
  type        = string
  description = "The name of the file with JSON key"
}

# Option 1: terraform apply -var-file="my.auto.tfvars"
# Option 2: Set default in variable definition
# Option 3: *.auto.tfvars in current directory
# Option 4: terraform apply -var="project_name=ncs-main" - NO MAPS
# Option 5: Environment variable: export TF_VAR_var_name=value - NO COLLECTIONS
