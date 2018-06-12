variable "is_ready" {
  description = "Wait until it's ready"
  type        = "string"
}

variable "iam_policy_name" {
  description = "Policy name for the EKS cluster"
  type        = "string"
}
