# Bastion

Needs vpc module!

## Usage

```hcl
module "bastion" {
  source = "github.com/terraform-training/terraform-modules//bastion?ref=main"

  environment  = local.environment
  network      = module.vpc.self_link
  subnetwork   = lookup(module.vpc.public_subnetworks_map, var.region)
  machine_type = "f1-micro" # machine type
  tags         = ["ssh"] # tags to open port
}
```
