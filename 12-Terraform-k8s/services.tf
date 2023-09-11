resource "kubernetes_service" "nginx" {
    metadata {
        name = "nginx"
        namespace = kubernetes_namespace.chamo.metadata.0.name
    }
    spec {
        selector = {
            app = kubernetes_deployment.nginx.spec.0.template.0.metadata.0.labels.app
        }
        port {
            port = 8080
        }
    }
}