resource "kubernetes_ingress_v1" "nginx-ingress" {
   metadata {
      name        = "nginx-ingress"
      namespace   = kubernetes_namespace.chamo.metadata.0.name
      annotations = {
        "nginx.ingress.kubernetes.io/rewrite-target": "/"
      }
   }
   spec {
      rule {
        http {
         path {
           path = "/"
           path_type = "Prefix"
           backend {
             service {
               name = "nginx"
               port {
                 number = 80
               }
             }
           }
        }
      }
    }
  }
}
