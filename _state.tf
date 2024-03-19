terraform {
  backend "s3" {
    bucket = "pp-demo-tfstate"
    key    = "tf.state"
    region = "eu-central-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}
