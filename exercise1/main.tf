provider "kubernetes" {
  version = "2.2.0"
  config_path = "/etc/rancher/k3s/k3s.yaml"
}

resource "kubernetes_deployment" "web_app" {
  metadata {
    name = "web-app"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "web-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "web-app"
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = "web"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "web_app" {
  metadata {
    name = "web-app"
  }

  spec {
    selector = {
      app = "web-app"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
