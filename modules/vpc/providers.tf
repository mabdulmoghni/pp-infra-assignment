
provider "aws" {
  profile = var.profile
  region  = var.main-region
  alias   = "eu-west-1"
}

