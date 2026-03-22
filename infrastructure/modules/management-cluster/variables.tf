variable "region" {
  description = "Cloud region for all resources"
  type        = string
  default     = "eu-west-3"
}

variable "environment" {
  description = "Environment name (e.g., development, staging, production)"
  type        = string
  default     = "development"
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "management"
}
