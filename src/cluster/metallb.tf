resource "kubernetes_namespace" "metallb_ns" {
  metadata {
    name = "metallb-system"
  }
}

module "metallb_config" {
  # source = "git::https://github.com/mrlunchbox777/terraform-modules//src/metallb/config/kind?ref=metallb/config/kind/0.0.1"
  source = "git::/home/jaunty/src/tools/terraform-modules//src/metallb/config/kind?ref=bug/fixing-errors"

  depends_on = [
    kubernetes_namespace.metallb_ns
  ]
}

module "metallb" {
  # source = "git::https://github.com/mrlunchbox777/terraform-modules//src/metallb?ref=metallb/0.0.1"
  source = "git::/home/jaunty/src/tools/terraform-modules//src/metallb?ref=bug/fixing-errors"

  depends_on = [
    kubernetes_namespace.metallb_ns
  ]

  config = module.metallb_config.config
}
