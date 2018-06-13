/**
* # EKS Module
* This module is used to created the Kubernetes cluster.  This will connect with the iam module that will set the permissions for the cluster.  
* ```bash
* Usage:
* 
* module "eks" {
*   source = "../../modules/eks"
*
*   is_ready     = "${var.is_ready}"
*   cluster_name = "${var.cluster_name}"
*   role_arn     = "${var.role_arn}"
*   subnet_ids   = "${var.subnet_ids}"
* }
*```
**/

resource "null_resource" "is_ready" {
  triggers {
    is_ready = "${var.is_ready}"
  }
}

resource "aws_eks_cluster" "eks-cluster" {
  depends_on = ["null_resource.is_ready"]

  name     = "${var.cluster_name}"
  role_arn = "${var.role_arn}"

  vpc_config {
    subnet_ids = ["${var.subnet_ids}"]
  }

  locals {
    kubeconfig-aws-1-9 = <<KUBECONFIG

apiVersion: v1
clusters:
- cluster:
    server: ${aws_eks_cluster.eks-cluster.endpoint}
    certificate-authority-data: ${aws_eks_cluster.eks-cluster.certificate_authority.0.data}
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: aws
  name: aws
current-context: aws
kind: Config
preferences: {}
users:
- name: aws
  user:
    auth-provider:
      config:
        cluster-id: ${var.cluster_name}
      name: aws
KUBECONFIG
  }
}
