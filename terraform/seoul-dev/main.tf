terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "networking" {
  source              = "../modules/networking"
  region              = var.region
  availability_zones  = var.availability_zones
  cidr_block          = var.cidr_block
  public_subnet_ips   = var.public_subnet_ips
}

module "security" {
  source = "../modules/security"
  region = var.region
  vpc_id = module.networking.vpc_id
}

module "k8s-cluster" {
  source = "../modules/cluster"
  region = var.region
  subnet_id = module.networking.public_subnet_ids[0]
  security_groups = [module.security.public_security_group_id]
  key_name = "app"
  instance_type = "t3.medium"
  volume_size = 30
  volume_type = "gp2"
  master_node_private_ip = var.master_node_private_ip
  worker_node1_private_ip = var.worker_node1_private_ip
  worker_node2_private_ip = var.worker_node2_private_ip

}

module "nfs-server" {
  source = "../modules/nfs-server"
  region = var.region
  subnet_id = module.networking.public_subnet_ids[0]
  security_groups = [module.security.nfs_security_group_id]
  key_name = "app"
  instance_type = "t2.micro"
  volume_size = 8
  volume_type = "gp2"
  private_ip = var.nfs_private_ip
  data_volume_size = 20
  data_volume_type = "gp2"
}