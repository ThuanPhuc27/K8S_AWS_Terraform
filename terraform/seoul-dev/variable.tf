variable "region" {
  type = string
  default = "ap-southeast-1"
}

variable "availability_zones" {
  type = list(string)
  nullable = false
}

variable "cidr_block" {
  type = string
  nullable = false
}

variable "public_subnet_ips" {
  type = list(string)
  nullable = false
  
}

################################################################################
# K8s Cluster Module - Variables 
################################################################################

variable "master_node_private_ip" {
  type = string
}

variable "worker_node1_private_ip" {
  type = string
}

variable "worker_node2_private_ip" {
  type = string
}

################################################################################
# NFS Module - Variables 
################################################################################

variable "nfs_private_ip" {
  type = string
}