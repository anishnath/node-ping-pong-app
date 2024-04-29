provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "deploy-ping-pong" {
  name  = "ping-pong-chart"
  chart = "../../infrastructure/helm/ping-pong"

  values = [
    "${file("values.yaml")}"
  ]
  version = "1.0.0"

  namespace = "ping-pong-application-argocd"

  set {
    name  = "image.repository"
    value = "anishnath/ping-pong"
  }

  set {
    name  = "image.tag"
    value = "f2500bc044669a69d1056761e8b75add742889df"
  }
}