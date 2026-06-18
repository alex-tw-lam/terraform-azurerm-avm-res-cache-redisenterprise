terraform {
  required_version = ">= 1.9, < 2.0"
  required_providers {
    azapi  = { source = "Azure/azapi",  version = ">= 2.4, < 3.0" }
    modtm  = { source = "Azure/modtm",  version = ">= 0.3, < 1.0" }
    random = { source = "hashicorp/random", version = ">= 3.5, < 4.0" }
  }
  backend "kubernetes" {
    in_cluster_config = true
    namespace          = "crossplane-system"
  }
}
