variable "k8s-config-path" {
  type    = string
  default = "~/.kube/config"
}

variable "k8s-config-context" {
  type    = string
  default = "kind-kind"
}
