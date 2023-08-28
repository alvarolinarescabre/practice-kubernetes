resource "kubernetes_namespace" "chamo" {
    metadata {
        name = "chamo"
    }
}