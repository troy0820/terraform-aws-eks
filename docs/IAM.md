# IAM Module
This module is used to give the permissions necessary to connect to the
EKS cluster.

```bash
Usage:

 module "cluster-iam" {
   source = "../../modules/iam"
   is_ready        = "${var.is_ready}"
   iam_policy_name = "${var.iam_policy_name}"

}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| iam_policy_name | Policy name for the EKS cluster | string | - | yes |
| is_ready | Wait until it's ready | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| is_complete | This triggers the next resource showing the module is complete. |
| policy_arn | The arn for the policy creaed for the EKS cluster. |

