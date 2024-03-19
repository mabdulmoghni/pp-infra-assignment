################################################################################
# General Variables from root module
################################################################################

variable "profile" {
  type = string
}

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


#variable "vpc_cidr_block" {
#  description = "The IPv4 CIDR block for the VPC"
#  type        = string
#}

#variable "subnets" {
#  type = list
#}
variable "subnets" {
  type = list(string)
}
################################################################################
################################################################################
# Database
variable "dbUser" {
  type        = string
  description = "Master database username"
  default     = "master"
}
variable "dbPass" {
  type        = string
  description = "Master database users password"
  default     = "l3*7$EI(JalvePcM"
}