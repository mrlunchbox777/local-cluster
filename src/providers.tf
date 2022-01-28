terraform {
  required_providers {
    helm = {
      version = "~>2.4.0"
    }
    kubernetes = {
      version = "~>2.7.0"
    }
  }

  required_version = "~> 1.1.0"
}

provider "kubernetes" {
  config_path    = var.k8s-config-path
  config_context = var.k8s-config-context
}

provider "helm" {
  kubernetes {
    config_path    = var.k8s-config-path
    config_context = var.k8s-config-context
  }
}