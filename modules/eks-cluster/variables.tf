################################################################################
# General Variables from root module
################################################################################

variable "main-region" {
  type = string
}

################################################################################
# Variables from other Modules
################################################################################

variable "vpc_id" {
  description = "VPC ID which EKS cluster is deployed in"
  type        = string
}

variable "private_subnets" {
  description = "VPC Private Subnets which EKS cluster is deployed in"
  type        = list(any)
}

################################################################################
# Variables defined using Environment Variables
################################################################################
variable "rolearn" {
  type        = string
  description = "Add admin role to the aws-auth configmap"
  default     = "arn:aws:iam::979780086174:user/mabdulmoghni"
}

