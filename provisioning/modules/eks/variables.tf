variable "is_ready" {
  description = "Wait until the trigger iss ready"
  type        = "string"
}

variable "cluster_name" {
  description = "The name of the EKS cluster that will also be used for the Kubeconfig"
  type        = "string"
}

variable "role_arn" {
  description = "The permissions arn from the iam module used to connect to the cluster"
  type        = "string"
}

variable "subnet_ids" {
  description = "The subnet ids that will be used for the EKS Cluster"
  type        = "string"
}
