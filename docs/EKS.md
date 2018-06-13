# EKS Module
This module is used to created the Kubernetes cluster.  This will connect with the iam module that will set the permissions for the cluster.
```bash
Usage:

module "eks" {
  source = "../../modules/eks"

  is_ready     = "${var.is_ready}"
  cluster_name = "${var.cluster_name}"
  role_arn     = "${var.role_arn}"
  subnet_ids   = "${var.subnet_ids}"
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cluster_name | The name of the EKS cluster that will also be used for the Kubeconfig | string | - | yes |
| is_ready | Wait until the trigger iss ready | string | - | yes |
| role_arn | The permissions arn from the iam module used to connect to the cluster | string | - | yes |
| subnet_ids | The subnet ids that will be used for the EKS Cluster | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| is_complete | This triggers the next resource showing the module is complete. |
| kubeconfig | Kubeconfig that will be copied to connect to cluster |

