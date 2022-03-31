terraform {
  backend "kubernetes" {
    secret_suffix = "tfstate"
    config_path   = "~/.kube/config"
  }

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
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}