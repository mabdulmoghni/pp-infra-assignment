
################################################################################
# Default Variables
################################################################################

variable "profile" {
  type    = string
  default = "default"
}

variable "main-region" {
  type    = string
  default = "eu-west-1"
}


################################################################################
# EKS Cluster Variables
################################################################################

variable "cluster_name" {
  type    = string
  default = "pp-demo-cluster"
}
variable "rolearn" {
  type        = string
  description = "Add admin role to the aws-auth configmap"
  default     = "arn:aws:iam::979780086174:user/mabdulmoghni"
}

################################################################################
# ALB Controller Variables
################################################################################

variable "env_name" {
  type    = string
  default = "pp-demo"
}

################################################################################
# Database
################################################################################
variable "dbUser" {
  type        = string
  description = "Master database username"
  default     = "master"
}
# below should be override by $ export TF_VAR_dbPass="xxXXXxxxX" && terraform apply
variable "dbPass" {
  type        = string
  description = "Master database users password"
  default     = "l3*7$EI(JalvePcM"
}