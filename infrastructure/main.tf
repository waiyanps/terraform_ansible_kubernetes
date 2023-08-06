module "do_k8s_terraform" {
  source          = "../module/do-k8s-terraform"
  do_token        = var.do_token
  cluster_name    = "kuberneteslab"
  cluster_version = "1.27.2-do.0"
  region          = "sgp1"
  node_pool_name  = "autoscale-worker-nodepool"
  node_size       = "s-2vcpu-2gb"
  min_nodes_count = 1
  max_nodes_count = 2
}



provider "kubernetes" {
  host  = module.do_k8s_terraform.endpoint
  token = module.do_k8s_terraform.kube_config[0].token
  cluster_ca_certificate = base64decode(
    module.do_k8s_terraform.kube_config[0].cluster_ca_certificate
  )

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "doctl"
    args = ["kubernetes", "cluster", "kubeconfig", "exec-credential",
    "--version=v1beta1", module.do_k8s_terraform.id]
  }

}

# resource "null_resource" "api_health_check" {
#   provisioner "local-exec" {
#     command = "until curl --output /dev/null --silent --fail --insecure ${module.do_k8s_terraform.endpoint}/healthz; do sleep 5; done"
#   }
#   depends_on = [
#     module.do_k8s_terraform
#   ]
# }