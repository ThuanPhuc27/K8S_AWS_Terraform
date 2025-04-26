provider "aws" {
  region = var.region
}

resource "aws_instance" "nfs-server" {
  ami           = var.amis[var.region]
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "nfs-server"
  }  
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_groups
  associate_public_ip_address = true
  private_ip = var.private_ip

  root_block_device {
    volume_size = var.volume_size      
    volume_type = var.volume_type   
    delete_on_termination = true
  }

  ebs_block_device {
    device_name           = "/dev/sdf"
    volume_size           = var.data_volume_size
    volume_type           = var.data_volume_type
    delete_on_termination = false
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo bash -c "$(curl -fsSL https://teleport.lptdevops.website/scripts/b92b1e2991b7fcdeaa58ba7b19484a78/install-node.sh)"
              
              sudo mkfs.ext4 /dev/xvdf

              sudo mkdir -p /data
              sudo mount /dev/xvdf /data
              sudo chown -R nobody:nogroup /data
              sudo chmod -R 777 /data

              UUID=$(blkid -s UUID -o value "/dev/xvdf")
              echo "UUID=$${UUID} /data ext4 defaults,nofail 0 2" | sudo tee -a /etc/fstab

              sudo apt install nfs-server -y
              echo "/data *(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports
              sudo exportfs -rav
              sudo systemctl restart nfs-server
              EOF
}
