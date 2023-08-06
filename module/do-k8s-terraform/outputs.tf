output "id" {
  value = digitalocean_kubernetes_cluster.kuberneteslab.name
}

output "endpont" {
  value = digitalocean_kubernetes_cluster.kuberneteslab.endpoint
}

output "kube_config" {
  value = digitalocean_kubernetes_cluster.kuberneteslab.kube_config
  sensitive = true
}
