# VPC Module

## This module is to create a VPC in AWS where your EKS cluster will live

```bash
Usage:

module "cluster-vpc" {
  source = "../../modules/network-vpc"
  is_ready = true
  cidr_block = "${var.cidr_block}"
  ....
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cidr_block | CIDR block of VPC | string | - | yes |
| is_ready | Wait until it's ready | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| is_complete | Registers the trigger to the next resource to be created afterwards |
| vpc_cidr_block | The cidr block that is used to create the VPC |
| vpc_id | The id of the vpc created for the EKS cluster |

