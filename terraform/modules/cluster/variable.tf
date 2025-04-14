variable "instance_type" {
  type        = string
  description = "Type of EC2 instance to launch. Example: t2.small"
  default = "t3.medium"
}

variable "region" {
  type = string
  default = "ap-southeast-1"
}

variable "security_groups" {
  type = list(string)
}

variable "subnet_id" {
  type = string
}

variable "amis" {
  type = map(any)
  default = {
    "ap-northeast-2" : "ami-0077297a838d6761d" #Ubuntu 22.04 Jammy
  }
}

variable "key_name" {
  type = string
}

##########################################

variable "master_node_private_ip" {
  type = string
}

variable "worker_node1_private_ip" {
  type = string
}

variable "worker_node2_private_ip" {
  type = string
}

variable "volume_size" {
  description = "The size of the root volume in GB."
  type        = number
  default     = 30
}

variable "volume_type" {
  description = "The type of the root volume (e.g., gp2, io1, st1)."
  type        = string
  default     = "gp2"
}