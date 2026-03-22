variable "region" {
  description = "Cloud region for all resources"
  type        = string
  default     = "eu-west-3"  # Change for GCP/Azure (e.g., "us-central1", "eastus")
}

variable "environment" {
  description = "Environment name (e.g., development, staging, production)"
  type        = string
  default     = "development"
}