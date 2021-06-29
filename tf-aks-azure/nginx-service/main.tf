provider "kubernetes" {}

resource "kubernetes_namespace" "gateway" {
  metadata {
    name = "${var.gateway}"
  }
}

resource "kubernetes_pod" "web" {
  metadata {
    name = "nginx"

    labels {
      name = "nginx"
    }

    namespace = "${kubernetes_namespace.gateway.metadata.0.name}"
  }

  spec {
    container {
      image = "nginx:latest"
      name  = "nginx"
    }
  }
}

resource "kubernetes_service" "web" {
  metadata {
    name      = "nginx"
    namespace = "${kubernetes_namespace.gateway.metadata.0.name}"
  }

  spec {
    selector {
      name = "${kubernetes_pod.web.metadata.0.labels.name}"
    }

    session_affinity = "ClientIP"

    port {
      port        = 80
      target_port = 5000
    }

    type = "LoadBalancer"
  }
}