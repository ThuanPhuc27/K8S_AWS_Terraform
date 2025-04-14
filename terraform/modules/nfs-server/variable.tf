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

variable "key_name" {
  type = string
}

variable "private_ip" {
  type = string
}

variable "data_volume_size" {
  description = "Size of the additional data EBS volume in GB."
  type        = number
  default     = 20
}

variable "data_volume_type" {
  description = "Type of the additional data EBS volume (e.g., gp2, gp3)."
  type        = string
  default     = "gp3"
}