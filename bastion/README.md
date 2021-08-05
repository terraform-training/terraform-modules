# Bastion

Needs vpc module from terraform-modules repo!

## Usage

```hcl
module "bastion" {
  source = "github.com/terraform-training/terraform-modules//bastion?ref=main"

  environment  = local.environment  # prefix for naming convention
  network      = module.vpc.self_link
  subnetwork   = lookup(module.vpc.public_subnetworks_map, var.region)
  machine_type = "f1-micro" # machine type
  tags         = ["ssh"] # tags to open port
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_key"></a> [key](#module\_key) | ./keys |  |

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.bastion](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_project_iam_member.bastion_editor_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.bastion](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_compute_default_service_account.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_default_service_account) | data source |
| [google_compute_zones.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | Bastion image | `string` | `"debian-cloud/debian-10"` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | Bastion machine type | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | VPC network name | `string` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | VPC subnetwork to put bastion into | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Network tags list for bastion | `list(any)` | n/a | yes |
| <a name="input_user"></a> [user](#input\_user) | Username to login to bastion | `string` | `"bastion"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip"></a> [ip](#output\_ip) | n/a |
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | n/a |
| <a name="output_public_key"></a> [public\_key](#output\_public\_key) | n/a |