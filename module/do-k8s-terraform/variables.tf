# Personal Access Token

variable "do_token" {}

# K8s variables

variable "cluster_name" {
  type = string
  default = "kuberneteslab"
  description = "Cluster name"
}

variable "cluster_version" {
    type = string
    default = "1.27.2-do.0"
    description = "Cluster version"
  }

variable "region" {
  
  type = string
  default = "sgp1"
  description = "Cluster location"
}

variable "node_pool_name" {
  type = string
  default = "autoscale-worker-pool"
  description = "Worker node pool name"
}   

variable "node_size" {
  type = string
  default = "s-2vcpu-2gb"
  description = "Node size"
}

variable "min_nodes_count" {
    type = number
    default = 1
    description = "Minimum node count for autoscale worker group"       

}

variable "max_nodes_count" {
    type = number
    default = 2
    description = "Maximum node count for autoscale worker group"
}