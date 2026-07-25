# Here is the terraform Provider block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "tzpc-site-tf-lock"
    key            = "workspaces/tzpc-site-tf.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true # Enables modern native S3 state locking (Terraform 1.10+)
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}