module "eks_cluster" {
  source = "../../modules/management-cluster"

  region = var.region
  environment = "staging"
}