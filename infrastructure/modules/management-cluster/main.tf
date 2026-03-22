terraform {
  required_version = ">= 1.0"

  required_providers {
    # ===================
    # AWS (strongly preferred)
    # ===================
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# -----------------------------------------------------------------------------
# AWS Provider
# -----------------------------------------------------------------------------
provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project     = "test"
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  }
}
