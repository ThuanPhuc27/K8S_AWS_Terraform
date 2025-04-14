provider "aws" {
  region = var.region
}

resource "aws_instance" "master-node" {
  ami           = var.amis[var.region]
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "master-node"
  }  
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_groups
  associate_public_ip_address = true
  private_ip = var.master_node_private_ip

  root_block_device {
    volume_size = var.volume_size      
    volume_type = var.volume_type   
    delete_on_termination = true
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo bash -c "$(curl -fsSL https://teleport.lptdevops.website/scripts/b92b1e2991b7fcdeaa58ba7b19484a78/install-node.sh)"
              sudo apt install nfs-common -y
              EOF
}

resource "aws_instance" "worker-node-1" {
  ami           = var.amis[var.region]
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "worker-node-1"
  }  
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_groups
  associate_public_ip_address = true
  private_ip = var.worker_node1_private_ip

  root_block_device {
    volume_size = var.volume_size      
    volume_type = var.volume_type   
    delete_on_termination = true
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo bash -c "$(curl -fsSL https://teleport.lptdevops.website/scripts/b92b1e2991b7fcdeaa58ba7b19484a78/install-node.sh)"
              sudo apt install nfs-common -y
              EOF
}

resource "aws_instance" "worker-node-2" {
  ami           = var.amis[var.region]
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "worker-node-2"
  }  
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_groups
  associate_public_ip_address = true
  private_ip = var.worker_node2_private_ip

  root_block_device {
    volume_size = var.volume_size      
    volume_type = var.volume_type   
    delete_on_termination = true
  }
  user_data = <<-EOF
              #!/bin/bash              
              # Tải và chạy script Teleport
              touch /tmp/install-teleport.sh
              sudo apt-get update
              sudo apt install curl
              curl -fsSL https://teleport.lptdevops.website/scripts/b92b1e2991b7fcdeaa58ba7b19484a78/install-node.sh -o /tmp/install-teleport.sh
              chmod +x /tmp/install-teleport.sh
              sudo /tmp/install-teleport.sh
              sudo apt install nfs-common -y
              EOF
}
 